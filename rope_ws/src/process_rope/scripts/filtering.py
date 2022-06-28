from asyncio import subprocess
import numpy as np
import cv2, copy
import matplotlib.pyplot as plt
import arrow
import networkx as nx
from scipy.interpolate import splprep, splev
from scipy.spatial.distance import cdist
import itertools, shapely
from shapely.geometry import LineString
from matplotlib import cm
COLORS = cm.get_cmap("Set1", 10)

def filteringEdges(graph, nodes, mask):

    #t0 = arrow.utcnow()

    mask_large = cv2.dilate(mask,np.ones((5,5),np.uint8),iterations = 2)

    edges = list(graph.edges())
    edges = np.array(edges)

    nodes_0 = nodes[edges[:,0]]
    nodes_1 = nodes[edges[:,1]]
    
    distances = np.linalg.norm(nodes_0 - nodes_1, axis=1)
    indeces = np.where(distances > np.mean(distances))[0]

    mid_points_to_test = ((nodes_0[indeces] + nodes_1[indeces]) / 2).astype(int)
    r = mask_large[mid_points_to_test[:,0], mid_points_to_test[:,1]]
    indeces_zero = np.where(r == 0)[0]
    
    indeces = np.array(indeces)
    edges_to_remove = edges[indeces[indeces_zero]]
    #print("edges to remove: ", edges_to_remove.T)

    graph.remove_edges_from(edges_to_remove)

    #print("time filtering edges: ", (arrow.utcnow() - t0).total_seconds()*1000)

    #plt.imshow(mask_large)
    #plt.show()



def filteringOrphanNodes(graph):
    orphans = [n[0] for n in graph.degree() if n[1] == 0]
    graph.remove_nodes_from(orphans)



def extractPahts(graph, points):
    sub_graphs = [graph.subgraph(c).copy() for c in nx.connected_components(graph)]
    #print("{} SUBGRAPH FOUND!".format(len(sub_graphs)))

    paths = {}
    for it, sg in enumerate(sub_graphs):
        endpoints = [n[0] for n in sg.degree() if n[1] == 1]
        if len(endpoints) == 2:
            path = nx.shortest_path(sg, endpoints[0], endpoints[1])
        #print("endpoints: ", endpoints)
        #print("path: ", path)

            if len(path) > 3:
                paths[it] = {"sequence": path, "points": points[path]}

    good_subgraphs = [sub_graphs[k] for k in list(paths.keys())]
    return paths, good_subgraphs


def uniqueRows(a):
    a = np.ascontiguousarray(a)
    unique_a = np.unique(a.view([('', a.dtype)]*a.shape[1]))
    return unique_a.view(a.dtype).reshape((unique_a.shape[0], a.shape[1]))


def computeSplineSimple(points, k=3, smoothing=0.0, periodic=0, num_points=100):
    tck, u = splprep(np.array(points).T, u=None, k=k, s=smoothing, per=periodic)
    u_new = np.linspace(u.min(), u.max(), num_points)
    x_new, y_new = splev(u_new, tck, der=0)
    return np.stack([x_new, y_new]).T


def computeSpline(points, k=3, smoothing=0.0, periodic=0, num_points=100):
    pts = np.array(points)

    tck, u = splprep(pts.T, u=None, k=k, s=smoothing, per=periodic)
    u_new = np.linspace(u.min(), u.max(), num_points)
    x_new, y_new = splev(u_new, tck, der=0)

    points_s = np.stack([x_new, y_new]).T

    xp, yp = splev(u_new, tck, der=1)
    xpp, ypp = splev(u_new, tck, der=2)
    curvature = np.abs(xp* ypp - yp* xpp) / np.power(xp** 2 + yp** 2, 3 / 2)

    if np.max(curvature) > 0.2:
        u_max = np.argmax(curvature)
        p_max = np.array([x_new[u_max], y_new[u_max]])
        dist = np.linalg.norm(p_max - points, axis=1)
        split_point = np.argmin(dist)
        new_points_1 = points[:split_point, :]
        new_points_2 = points[split_point+1:, :]

        # new spline 1
        if new_points_1.shape[0] > 3:
            tck1, u1 = splprep(new_points_1.T, u=None, k=k, s=smoothing, per=periodic)
            u1_new = np.linspace(u1.min(), u1.max(), num_points)
            x1_new, y1_new = splev(u1_new, tck1, der=0)
            new_points_s1 = np.stack([x1_new, y1_new])
        else:
            new_points_s1 = new_points_1.T

        # new spline 2
        if new_points_2.shape[0] > 3:
            tck2, u2 = splprep(new_points_2.T, u=None, k=k, s=smoothing, per=periodic)
            u2_new = np.linspace(u2.min(), u2.max(), num_points)
            x2_new, y2_new = splev(u2_new, tck2, der=0)
            new_points_s2 = np.stack([x2_new, y2_new])
        else:
            new_points_s2 = new_points_2.T

        if False:
            fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(9, 6))
            print("u: ", u_max, p_max)
            ax1.plot(y_new,x_new, c="red")
            ax1.plot(new_points_s1[1], new_points_s1[0], "green")
            ax1.plot(new_points_s2[1], new_points_s2[0], "blue")
            ax2.plot(curvature)
            plt.show()

        return [new_points_1, new_points_2], [new_points_s1, new_points_s2]


    return [points], [points_s.T]



def computeSplines(paths):

    rv_splines, rv_points = [], []
    for k, v in paths.items():
        points = np.array(v["points"])
        p, s = computeSpline(points)
        rv_splines.extend(s)
        rv_points.extend(p)
    
    splines, paths_new = {}, {}
    for k, p in enumerate(rv_points):
        splines[k] = rv_splines[k]
        paths_new[k] = p

    return paths_new, splines



def retrievePointsCloseToLine(point_start, line_dir, points_set, l, s, max_distance=5):

    ls = np.arange(0, l, s).reshape(-1, 1)
    ls = np.repeat(ls, 2, axis=1)
    D = np.repeat(line_dir.reshape(1,-1), ls.shape[0], axis=0)
    points_line = (point_start + D * ls).astype(int)

    C = cdist(points_line, points_set)
    indeces = np.argmin(C, axis=1)
    values = np.min(C, axis=1)
    indeces_checked = []
    for i, idx in enumerate(indeces):
        if values[i] < max_distance and idx not in indeces_checked:
            indeces_checked.append(idx)

    return points_set[indeces_checked], indeces_checked



def dloExtensionNodes(paths, nodes, s=5, l=50, th_max_distance=10):
    nodes_of_paths = []
    for _, value in paths.items():
        nodes_of_paths.extend(value["sequence"])
    
    all_nodes = np.arange(0,nodes.shape[0])
    diff_nodes = list(set(all_nodes) - set(nodes_of_paths))

    diff_nodes_pos = nodes[diff_nodes]

    if len(diff_nodes_pos) == 0:
        return []


    candidate_edges = []
    for k, value in paths.items():
        nodes_ids = value["sequence"]
        start_node = nodes_ids[0]
        tail_node = nodes_ids[-1]

        sub_points = value["points"]

        start_point = sub_points[0]
        start_nn_point = sub_points[1]
        tail_point = sub_points[-1]
        tail_nn_point = sub_points[-2]

        # head
        dir_head = start_point - start_nn_point
        dir_head = dir_head / np.linalg.norm(dir_head)
        nodes_head, nodes_head_idx = retrievePointsCloseToLine(start_point, dir_head, diff_nodes_pos, l=l, s=s, max_distance=th_max_distance)
        if nodes_head.shape[0] > 0:
            idx = diff_nodes[nodes_head_idx[-1]]
            candidate_edges.append(tuple([start_node, idx]))

        # tail
        dir_end = tail_point - tail_nn_point
        dir_end = dir_end / np.linalg.norm(dir_end)

        nodes_end, nodes_end_idx = retrievePointsCloseToLine(tail_point, dir_end, diff_nodes_pos, l=l, s=s, max_distance=th_max_distance)
        if nodes_end.shape[0] > 0:
            idx = diff_nodes[nodes_end_idx[-1]]
            candidate_edges.append(tuple([tail_node, idx]))

    return candidate_edges


def dloExtensionNodesUpdate(paths, ext_preds, nodes_pos, th_similarity=0.2):
    paths_up = {}
    for k, value in paths.items():
        new_sequence = list(value["sequence"])
        new_points = list(value["points"])

        for p in ext_preds:
            if p["node_0"] in value["sequence"] and p["score"] > th_similarity:
                idx = new_sequence.index(p["node_0"])
                if idx == 0:
                    new_sequence.insert(0, p["node_1"])
                    new_points.insert(0, nodes_pos[p["node_1"],:])
                else:
                    new_sequence.append(p["node_1"])
                    new_points.append(nodes_pos[p["node_1"],:])                   
        
        
        paths_up[k] = {"sequence": new_sequence, "points": new_points}
    return paths_up





def dloExtensionPointsMaxmask(paths, points_maxmask, s=5, l=50, shape=(360,640)):

    mask = np.zeros(shape, dtype=np.uint8)
    for k, value in paths.items():
        if "points" in value: sub_points = list(value["points"])
        else: sub_points = list(value)

        points = np.array(sub_points)
        points[:, [1, 0]] = points[:, [0, 1]]
        pts = points.reshape((-1, 1, 2)).astype(np.int32)
        cv2.polylines(mask,[pts],False, 255,5)
    
    indeces = np.where(mask[points_maxmask[:,0], points_maxmask[:,1]] != 255)[0]
    points_maxmask_masked = points_maxmask[indeces]

    path_points = {}
    for k, value in paths.items():
        if "points" in value:
            sub_points = list(value["points"])
        else:
            sub_points = list(value)

        start_point = sub_points[0]
        start_nn_point = sub_points[1]
        tail_point = sub_points[-1]
        tail_nn_point = sub_points[-2]

        # begin
        dir_begin = start_point - start_nn_point
        dir_begin = dir_begin / np.linalg.norm(dir_begin)
        nodes_begin, _ = retrievePointsCloseToLine(start_point, dir_begin, points_maxmask_masked, l=l, s=s)
        nodes_begin = nodes_begin[1:,:]
        if nodes_begin.shape[0] > 0:
            sub_points.insert(0, nodes_begin[-1,:])

        # tail
        dir_end = tail_point - tail_nn_point
        dir_end = dir_end / np.linalg.norm(dir_end)

        nodes_end, _ = retrievePointsCloseToLine(tail_point, dir_end, points_maxmask_masked, l=l, s=s)
        nodes_end = nodes_end[1:,:]
        if nodes_end.shape[0] > 0:
            sub_points.append(nodes_end[-1,:])
        
        path_points[k] = sub_points


    return path_points


########################################################################################

def checkClosenessPathsEndpoints(paths, max_distance=50, debug=False):
    endpoints = {}
    endpoints_l = []
    for k, v in paths.items():
        endpoints[k] = [v[0], v[-1]]
        endpoints_l.append(v[0])
        endpoints_l.append(v[-1])
    
    if debug: print(endpoints)
    endpoints_l = np.array(endpoints_l)
    C = cdist(endpoints_l, endpoints_l)
    C[C==0] = 1000
    indeces = np.argmin(C, axis=1)
    values = np.min(C, axis=1)
    pairs = []
    for i, idx in enumerate(indeces):
        if values[i] < max_distance and [i,idx] not in pairs and [idx,i] not in pairs:
            if np.abs(i-idx) > 1:
                pairs.append([i, idx])

    if debug: print(pairs)

    max_key = max(list(endpoints.keys()))
    nodes_pos = np.zeros((max_key+1, 2))
    nodes_dir = np.zeros((max_key+1, 2))
    layout = [None] * (max_key+1)
    candidate_edges = []
    for p0,p1 in pairs:

        endpoint0 = np.array(endpoints_l[p0])
        endpoint1 = np.array(endpoints_l[p1])

        m0, m1 = None, None
        for k,v in endpoints.items():
            if np.any(np.all(endpoint0 == np.array(v), axis=1)):
                m0 = k
            if np.any(np.all(endpoint1 == np.array(v), axis=1)):
                m1 = k
        
        edge = tuple([m0,m1])
        nodes_pos[m0,:] = endpoint0.reshape(1,-1)
        nodes_pos[m1,:] = endpoint1.reshape(1,-1)
        candidate_edges.append(edge)


        #dir
        if  np.all(endpoint0 == endpoints[m0][0]):
            nodes_dir[m0,:] = (endpoint0 - paths[m0][1]).reshape(1,-1)
            layout[m0] = 0
        else:
            nodes_dir[m0,:] = (endpoint0 - paths[m0][-2]).reshape(1,-1)
            layout[m0] = -1

        if np.all(endpoint1 == endpoints[m1][0]):
            nodes_dir[m1,:] = (endpoint1 - paths[m1][1]).reshape(1,-1)
            layout[m1] = 0
        else:
            nodes_dir[m1,:] = (endpoint1 - paths[m1][-2]).reshape(1,-1)
            layout[m1] = -1


        nodes_pos = np.array(nodes_pos).reshape(-1,2)
        nodes_dir = np.array(nodes_dir).reshape(-1,2)
        layout = np.array(layout).reshape(-1,1)

    return nodes_pos, nodes_dir, candidate_edges, layout





def closenessPathsEndpointsUpdate(paths, preds, nodes_pos, layout, mask_img, th_similarity=0.75):

    paths_up = copy.deepcopy(paths)
    max_k = max(list(paths_up.keys())) + 1
    k_done = []
    k_delete = []
    for k in paths.keys():

        if k in k_done:
            continue

        for p in preds:
            if p["score"] > th_similarity:
                n0 = p["node_0"]
                n1 = p["node_1"]
                k_done.append(n0)
                k_done.append(n1)

                point_0 = nodes_pos[n0]
                point_1 = nodes_pos[n1]
                mid_point = (point_0 + point_1)/2
                mask_value = mask_img[tuple(mid_point.astype(int))]
                if mask_value == 255:

                    k_delete.append(n0)
                    k_delete.append(n1)

                    list_points_0 = np.array(paths[n0])
                    list_points_1 = np.array(paths[n1])
                    if layout[n0] == 0:
                        list_points_0 = np.flip(list_points_0, axis=0)
                    if layout[n1] == -1:
                        list_points_1 = np.flip(list_points_1, axis=0)

                    paths_up[max_k] = np.concatenate([list_points_0, list_points_1], axis=0)
                    max_k += 1
    
    for d in list(set(k_delete)):
        del paths_up[d]

    return paths_up


########################################################################################

def splinesIntersections(splines, source_img, dist_img):

    sintersec = {}
    pairs_done = []
    for k1, v1 in splines.items():
        for k2, v2 in splines.items():
            if k1 == k2 or [k1,k2] in pairs_done or [k2,k1] in pairs_done:
                continue

            pairs_done.append([k1,k2])

            points1 = list(zip(v1[0], v1[1]))
            points2 = list(zip(v2[0], v2[1]))

            if len(points1) < 2 or len(points2) < 2:
                continue

            line0 = LineString(points1)
            line1 = LineString(points2)

            z = line0.intersection(line1) 
            if type(z) == shapely.geometry.multipoint.MultiPoint:
                intersect_points = [(point.x, point.y) for point in z]
            elif type(z) == shapely.geometry.point.Point:
                intersect_points = [(z.x, z.y)]
            else:
                intersect_points = None
            
            if intersect_points is not None:
                if tuple([k1,k2]) in sintersec.keys():
                    sintersec[tuple([k1,k2])].extend(intersect_points)
                elif tuple([k2,k1]) in sintersec.keys():
                    sintersec[tuple([k2,k1])].extend(intersect_points)
                else:
                    sintersec[tuple([k1,k2])] = intersect_points
 

    step_init = 5
    for k, v in sintersec.items():
        tmp = []
        for int_point in v:
            int_point = np.array(int_point).astype(int)
            target_dist = dist_img[tuple(int_point)] * 2

            spline_0 = splines[k[0]].T.astype(int)
            s = np.sum(np.square(spline_0 - int_point), axis=1)
            s_argmin = np.argmin(s)
            for i in range(1, 6):
                up_bound = s_argmin+step_init*i
                low_bound = s_argmin-step_init*i
                if low_bound < 0:
                    low_bound = 0
                if up_bound >= spline_0.shape[0]:
                    up_bound = -1

                p0 = spline_0[low_bound,:]
                p1 = spline_0[up_bound,:]

                if np.linalg.norm(p0 - p1) > target_dist or i == 5:
                    locations_0 = spline_0[s_argmin-step_init*i:s_argmin+step_init*i, :]
                    break

            spline_1 = splines[k[1]].T.astype(int)
            s = np.sum(np.square(spline_1 - int_point), axis=1)
            s_argmin = np.argmin(s)
            for i in range(1, 6):
                up_bound = s_argmin+step_init*i
                low_bound = s_argmin-step_init*i
                if low_bound < 0:
                    low_bound = 0
                if up_bound >= spline_1.shape[0]:
                    up_bound = -1

                p0 = spline_1[low_bound,:]
                p1 = spline_1[up_bound,:]

                if np.linalg.norm(p0 - p1) > target_dist or i == 5:
                    locations_1 = spline_1[s_argmin-step_init*i:s_argmin+step_init*i, :]
                    break

            tmp.append({"point": int_point, "locations": [locations_0, locations_1]})
        sintersec[k] = tmp

    return intersectionScoresFromColor(sintersec, source_img)


def stdColorsBetweenPoints(locations, image):
    locations = locations.astype(np.int32)        
    values = image[locations[:,0], locations[:,1]]
    return np.std(values, axis=0)  

def intersectionScoresFromColor(splines_intersections, image, colored_mask=None):

    for k, v in splines_intersections.items():
        for vv in v:
            std0 = stdColorsBetweenPoints(vv["locations"][0], image)
            std1 = stdColorsBetweenPoints(vv["locations"][1], image)
            
            vv["score0"] = np.mean(std0)
            vv["score1"] = np.mean(std1)

    return splines_intersections



########################################################################################

def drawColorMaks(splines, dist_img, mask_seg):

    mask = np.zeros(dist_img.shape, dtype=np.uint8)
    mask = np.repeat(mask[..., np.newaxis], 3, axis=2)

    radii = {}
    for k, value in splines.items():      
        if value.size != 0:
            value = value.astype(int)
            dist_values = dist_img[value[0,:], value[1,:]]
            r = round(np.median(dist_values)) + 10
            radii[k] = r

            drawFunction(mask, value, COLORS(k), radii[k])

    mask[mask_seg == 0] = (0,0,0)
    return mask



def drawFunction(mask, arr_points, color, radius):
    points = np.array(arr_points).T
    points[:, [1, 0]] = points[:, [0, 1]]
    pts = points.reshape((-1, 1, 2)).astype(np.int32)
    c = [int(color[0]*255), int(color[1]*255), int(color[2]*255)]
    cv2.polylines(mask, [pts], False, c, radius)    
