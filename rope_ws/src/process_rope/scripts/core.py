import cv2, math
import numpy as np
import torch
import torch_geometric

import arrow
import networkx as nx
from termcolor import cprint
import matplotlib.pyplot as plt


torch.manual_seed(0)
np.random.seed(0)

from filtering import *


class DLO():

    def __init__(self, knn, th_edges_similarity=0.25):
        self.knn = knn
        self.th_edge_similarity = th_edges_similarity


    def solve(self, mask_img, debug=False):

        # graph generation
        nodes, edges, dist_img, nodes_dir, points_maxmask, time = GraphData.compute(mask_img, knn=self.knn, th_edges_similarity=self.th_edge_similarity)
        self.dist_img = dist_img
        self.points_maxmask = points_maxmask
        max_dist = np.max(dist_img)

        t0 = arrow.utcnow()
        nodes_nx = [(it, {"pos": np.array(xx)}) for it, xx in enumerate(nodes)]

        gnew = nx.Graph()
        gnew.add_nodes_from(nodes_nx)
        gnew.add_edges_from(edges, label=0)

        filteringEdges(gnew, nodes, mask_img)

        self.graph_init = gnew.copy()

        # remove nodes without edges
        filteringOrphanNodes(gnew)

        # extract subgraphs
        t3 = arrow.utcnow()
        paths, subgraphs = extractPahts(gnew, nodes)
        if debug: print("time subgraphs: ", (arrow.utcnow()-t3).total_seconds()*1000)

        if not paths:
            return {}, {}, np.zeros(mask_img.shape, dtype=np.uint8)

        
        # splines
        t4 = arrow.utcnow()
        paths, splines = computeSplines(paths)
        if debug: print("time splines: ", (arrow.utcnow()-t4).total_seconds()*1000)     


        t5 = arrow.utcnow()
        self.colored_mask = drawColorMaks(splines, dist_img, mask_img)
        if debug: print("time colored mask: ", (arrow.utcnow()-t5).total_seconds()*1000)     


        time2 = (arrow.utcnow()-t0).total_seconds()*1000
        tot_time = time2 + time
        if debug: cprint("*** TIME TOT: {0:.3f}".format(tot_time), "yellow")

        self.graph = gnew


        return paths, splines, self.colored_mask


    def show(self, mask_img, splines):

        fig = plt.figure(figsize=(14,9))

        gs = fig.add_gridspec(2,2)

        ax1 = fig.add_subplot(gs[0, 0])
        ax2 = fig.add_subplot(gs[0, 1])
        ax3 = fig.add_subplot(gs[1, 1])
        ax4 = fig.add_subplot(gs[1, 0])

        # final result
        ax1.imshow(mask_img)
        ax1.axis("off")
        for k,v in splines.items():
            ax1.plot(v[1], v[0], label=str(k), linewidth=3)
        ax1.legend()
        ax1.title.set_text("Source Image with DLO's Splines")

        # graph init
        plt.sca(ax2)
        ax2.imshow(mask_img)
        nx.draw(self.graph_init, pos={k: (n["pos"][1], n["pos"][0]) for k, n in self.graph_init.nodes(data=True)}, 
                node_size=50, alpha=0.8, linewidths=1.0, width=1.0)
        for k, n in self.graph_init.nodes(data=True):
            ax2.text(n["pos"][1], n["pos"][0], k, fontsize=6, ha='center', va='center', color="white")
        ax2.title.set_text('Init Graph')

        # graph
        plt.sca(ax3)
        ax3.imshow(mask_img)
        nx.draw(self.graph, pos={k: (n["pos"][1], n["pos"][0]) for k, n in self.graph.nodes(data=True)}, 
                node_size=50, alpha=0.8, linewidths=1.0, width=1.0)
        for k, n in self.graph.nodes(data=True):
            ax3.text(n["pos"][1], n["pos"][0], k, fontsize=6, ha='center', va='center', color="white")
        ax3.title.set_text('Final Graph')

        ###
        ax4.imshow(self.colored_mask)
        ax4.title.set_text('colored mask')
        plt.tight_layout(pad=0.1)
        plt.show()



class GraphData():

    def compute(mask, knn, th_edges_similarity, th_mask=127, debug=False):
        t0 = arrow.utcnow()

        mask[mask < th_mask] = 0
        mask[mask != 0] = 255

        # DISTANCE IMAGE
        dist_img = cv2.distanceTransform(mask, cv2.DIST_L2, 3)
        dist_img = cv2.GaussianBlur(dist_img,(3,3),0)

        gen = GraphGeneration()
        nodes, edges, nodes_dir, points_maxmask = gen.graphGeneration(mask, dist_img, n_knn=knn, th_edges_similarity=th_edges_similarity, debug=debug)
        
        time = (arrow.utcnow()-t0).total_seconds()*1000
        if debug: cprint("*** TIME GRAPH GENERATION: {}".format(time), "yellow")

        return nodes, edges, dist_img, nodes_dir, points_maxmask, time





class GraphGeneration():

    def orientationFromWindow(self, windows, l, debug=False):
        W = np.array(windows)

        wsize = (l*2)+1
        X = np.zeros((wsize,wsize))
        Y = np.zeros((wsize,wsize))
        for i in range(wsize) :
            for k in range(wsize) :
                X[k,i] = (l-i) 
                Y[k,i] = (l-k) 


        XX = np.repeat(X[np.newaxis, :, :], W.shape[0], axis=0)
        YY = np.repeat(Y[np.newaxis, :, :], W.shape[0], axis=0)
        Gx, Gy = np.gradient(W, axis=(1,2))
        Fx = np.sum(XX*Gx, axis=(1,2))
        Fy = np.sum(YY*Gy, axis=(1,2))


        if debug:

            for i in range(W.shape[0]):     
                F_tot = math.sqrt(math.pow(Fx[i], 2) + math.pow(Fy[i],2))
                theta = math.acos(Fx[i]/F_tot) *180/3.14
                print("theta: ", i, theta)
                angle = np.deg2rad(theta)
                x_new = l + 5 * np.cos(angle)
                y_new = l - 5 * np.sin(angle)
                x_new2 = l - 5 * np.cos(angle)
                y_new2 = l + 5 * np.sin(angle)
                x = [x_new, x_new2]
                y = [y_new, y_new2]
                plt.imshow(windows[i])
                plt.plot(y, x, linewidth=5, c="red")
                plt.scatter(7, 7, s=250, c="red")
                plt.tight_layout(pad=0.1)
                plt.show()
                #plt.savefig(f"{int(theta)}.png", dpi=300, bbox_inches='tight', pad_inches = 0)
                #plt.close()


        return Fx, Fy


    def distance2D(self, point1, point2):
        return ((point1[0]-point2[0])**2 + (point1[1]-point2[1])**2)**0.5


    def edgeSimilarity(self, points, edges, points_dirs, th=0.5, debug=False):
        new_edges = []
        edges = list(zip(edges[0], edges[1]))
        similarity = torch.nn.CosineSimilarity(dim=1)
        for k, p in enumerate(points):

            edges_p = [e for e in edges if e[0] == k or e[1] == k]
            scores = {}
            for e1, e2 in edges_p:
                if e1 == k:
                    node1, node2 = e1, e2
                else:
                    node1, node2 = e2, e1
                

                pos1 = points[node1]
                pos2 = points[node2]

                dir_edge = pos2 - pos1
                dir_edge = dir_edge / np.linalg.norm(dir_edge)

                dx = - dir_edge[1]
                dy = dir_edge[0]
                dir_edge = np.array([dx,dy])
                dir_edge_t = torch.Tensor(np.array(dir_edge)).unsqueeze(dim=0)

                dir1_t = points_dirs[node1]
                dir1_t = dir1_t / np.linalg.norm(dir1_t)
                angle1 = math.acos(dir1_t[0])
                dir_node1_t = torch.Tensor(np.array([np.sin(angle1), np.cos(angle1)])).unsqueeze(dim=0)

                dir2_t = points_dirs[node2]
                dir2_t = dir2_t / np.linalg.norm(dir2_t)        
                angle2 = math.acos(dir2_t[0]) 
                dir_node2_t = torch.Tensor(np.array([np.sin(angle2), np.cos(angle2)])).unsqueeze(dim=0)

                sim1 = float(similarity(dir_node1_t, dir_edge_t).detach().numpy())
                sim2 = float(similarity(dir_node2_t, dir_edge_t).detach().numpy())

                tot_score = sim1 * np.fabs(sim2)
                scores[tuple([node1,node2])] = tot_score

            if debug: 
                print("")
                print("node: ", k, p)
                print(scores)
            edges_p = list(scores.keys())
            scores = np.array(list(scores.values()))
            edges_p = np.array(edges_p)


            # POSITIVES ABOVE THRESHOLD
            positives = [ix for ix, x in enumerate(np.where(scores > th, scores, 0)) if x != 0]
            if len(positives) > 0:
                distances = [self.distance2D(points[e[0]], points[e[1]]) for e in edges_p[positives]]
                distances = 1 - (np.array(distances) - np.min(distances)) / np.max(distances)
                pos_scores_w = scores[positives] * distances
                best_positive_idx = positives[pos_scores_w.argmax()]
                edge_pos = edges_p[best_positive_idx]
                new_edges.append(edge_pos)

                if debug:
                    print("positives: ", edges_p[positives][:,1].T)
                    print("distances: ", distances)
                    print("pos_scores_w: ", pos_scores_w)
                    print("edge pos :", edge_pos)

            # NEGATIVE ABOVE THRESHOLD
            negatives = [ix for ix, x in enumerate(np.where(scores < -th, scores, 0)) if x != 0]
            if len(negatives) > 0:
                distances = [self.distance2D(points[e[0]], points[e[1]]) for e in edges_p[negatives]]
                distances = 1 - (np.array(distances) - np.min(distances)) / np.max(distances)

                neg_scores_w = scores[negatives] * distances


                best_negative_idx = negatives[neg_scores_w.argmin()]
                edge_neg = edges_p[best_negative_idx]
                new_edges.append(edge_neg)

                if debug:
                    print("negatives: ", edges_p[negatives][:,1].T)
                    print("neg_scores_w: ", neg_scores_w)
                    print("distances: ", distances)
                    print("edge neg :", edge_neg)

        return new_edges



    def edgeSimilarityFast(self, matrix_scores, X, edges, edges_norm, adj_fake, th=0.25):

        X2 = np.repeat(X[edges].reshape(1,-1), matrix_scores.shape[0], axis=0)

        #t0 = arrow.utcnow()

        edges_tuples = edges.T
        E = np.repeat(edges_norm.reshape(1,-1), matrix_scores.shape[0], axis=0)
        M = matrix_scores * X2 * adj_fake

        pos_matrix_scores = M > th
        E_pos_zero = E.copy()
        E_pos_zero[pos_matrix_scores == False] = 0
        E_pos_max = np.repeat(np.max(E_pos_zero, axis=1).reshape(-1,1), matrix_scores.shape[1], axis=1)

        E_pos_inf = E.copy()
        E_pos_inf[pos_matrix_scores == False] = np.inf
        E_pos_min = np.repeat(np.min(E_pos_inf, axis=1).reshape(-1,1), matrix_scores.shape[1], axis=1)
        W_pos = 1 - (E - E_pos_min) / E_pos_max
        W_pos[pos_matrix_scores == False] = 0
        S_pos = M * W_pos
        S_pos[pos_matrix_scores == False] = 0

        pos_indeces = np.argmax(S_pos, axis=1)
        pos_edges = edges_tuples[pos_indeces]

        neg_matrix_scores = M < -th
        E_neg_zero = E.copy()
        E_neg_zero[neg_matrix_scores == False] = 0
        E_neg_max = np.repeat(np.max(E_neg_zero, axis=1).reshape(-1,1), matrix_scores.shape[1], axis=1)

        E_neg_inf = E.copy()
        E_neg_inf[neg_matrix_scores == False] = np.inf
        E_neg_min = np.repeat(np.min(E_neg_inf, axis=1).reshape(-1,1), matrix_scores.shape[1], axis=1)
        W_neg = 1 - (E - E_neg_min) / E_neg_max
        W_neg[neg_matrix_scores == False] = 0
        S_neg = M * W_neg
        S_neg[neg_matrix_scores == False] = 0

        neg_indeces = np.argmin(S_neg, axis=1)
        neg_edges = edges_tuples[neg_indeces]

        new_edges_fast = np.concatenate([pos_edges, neg_edges])

        #print("time edge similarity (fast): ", (arrow.utcnow() - t0).total_seconds()*1000)
        
        return new_edges_fast
      

    def cosineSim(self, a, b, eps=1e-8):
        a_n, b_n = a.norm(dim=1)[:, None], b.norm(dim=1)[:, None]
        a_norm = a / torch.clamp(a_n, min=eps)
        b_norm = b / torch.clamp(b_n, min=eps)
        sim_mt = torch.mm(a_norm, b_norm.transpose(0, 1))
        return sim_mt


    def similarityScoreNodesAndEdges(self, nodes, edges, points_dirs):

        edges_dirs, edges_norm, adj_fake = self.edgesPrep(edges, nodes)
        edges_dirs = torch.Tensor(edges_dirs) 
        adj_edges_matrix = torch.Tensor(adj_fake) 

        norm = np.linalg.norm(points_dirs, axis=1)[:,None]
        d = points_dirs / np.clip(norm, 1e-6, None)
        d = torch.Tensor(d)

        angles = torch.Tensor(torch.arccos(d[:,0])) 
        nodes_dir = torch.stack([torch.sin(angles), torch.cos(angles)]).T

        X = torch.abs(self.cosineSim(nodes_dir, nodes_dir))

        similarity_score_edges = self.cosineSim(nodes_dir, edges_dirs) * torch.abs(adj_edges_matrix)

        return similarity_score_edges, X, edges_norm, adj_fake


    def edgesPrep(self, edges, nodes):
        edges_list = list(zip(edges[0], edges[1]))

        edge_attr, edge_norm = [], []
        adj_fake = np.zeros((len(nodes), len(edges_list)))
        for it, (e0,e1) in enumerate(edges_list):
            p0 = np.array(nodes[e0])
            p1 = np.array(nodes[e1])
            edge_norm.append(np.linalg.norm((p1 - p0)))

            dir = (p1 - p0) / np.array([480,640])
            
            dx = - dir[1]
            dy = dir[0]


            dir_edge = np.array([dx,dy])

            edge_attr.append(dir_edge)
            adj_fake[e0,it] = 1
            adj_fake[e1,it] = -1

        edge_attr = np.array(edge_attr).reshape(-1,2)
        edge_norm = np.array(edge_norm) 
        return edge_attr, edge_norm, adj_fake


    def pointsInside(self, arr, point_target, radius):
        return arr[np.linalg.norm(arr[:,:2] - point_target, axis=1) < radius]



    def graphGeneration(self, mask, dist_img, wsize=15, n_knn=8, th_edges_similarity=0.25, debug=False):

        #max_dist = np.max(dist_img)

        t0 = arrow.utcnow()
        kernel = np.ones((3,3))
        max_image = cv2.dilate(dist_img, kernel)
        maxmask = (dist_img == max_image) & mask
        
        if debug: print("time dilate: ", (arrow.utcnow()-t0).total_seconds()*1000)


        t0 = arrow.utcnow()
        x,y = np.nonzero(maxmask)
        points_aug = np.stack([x, y, dist_img[x,y]], axis=-1)
        points_aug_f = points_aug[np.where(points_aug[:,2] > 3)]
        points_aug_f = points_aug_f[points_aug_f[:, 2].argsort()][::-1]
        if debug: print("time points retrieval: ", (arrow.utcnow()-t0).total_seconds()*1000)

        '''
        t0 = arrow.utcnow()
        special_points_f = np.empty((0,2))
        for sp in points_aug_f[:10,:]:
            out = self.pointsInside(special_points_f, sp[:2], max_dist+5)
            if out.shape[0] == 0:
                special_points_f = np.append(special_points_f, np.expand_dims(sp[:2], axis=0), axis=0)
        print("time special points: ", (arrow.utcnow()-t0).total_seconds()*1000)
        '''

        points = np.stack([x,y]).T
        points_maxmask = points
        #print("points: ", points.shape)
        # fps
        points = torch.Tensor(points)
        indices_fps = torch_geometric.nn.fps(points, ratio=0.3)
        reduced = points[indices_fps].detach().cpu().numpy()


        if debug: print("time fps: ", (arrow.utcnow()-t0).total_seconds()*1000)

        '''
        # add points if needed
        t0 = arrow.utcnow()
        for sp in special_points_f:
            out = self.pointsInside(reduced, sp[:2], max_dist)
            if out.shape[0] == 0:
                reduced = np.append(reduced, np.expand_dims(sp, axis=0), axis=0)

        print("timexx adding: ", (arrow.utcnow()-t0).total_seconds()*1000)
        '''

        t0 = arrow.utcnow()
        ######################
        reduced = reduced.astype(int)
        l = (wsize-1)//2
        windows = []
        points = []
        for p in reduced:    
            w = dist_img[p[0]-l:p[0]+l+1, p[1]-l:p[1]+l+1]
            if w.shape == (wsize, wsize):
                windows.append(w)
                points.append(p)
        points = np.array(points)
        if debug: print("time windows: ", (arrow.utcnow()-t0).total_seconds()*1000)


        t0 = arrow.utcnow()
        fx, fy = self.orientationFromWindow(windows, l)
        if debug: print("time orientation from window: ", (arrow.utcnow()-t0).total_seconds()*1000)

        t0 = arrow.utcnow()

        edges = torch_geometric.nn.knn_graph(torch.Tensor(points), n_knn).detach().cpu().numpy()
        if debug: print("time edges (knn_graph): ", (arrow.utcnow()-t0).total_seconds()*1000)


        t0 = arrow.utcnow()
        points_dirs = np.stack([fx,fy]).T
        matrix_scores, X, edges_norm, adj_fake = self.similarityScoreNodesAndEdges(points, edges, points_dirs)
        if debug: print("time matrix scores: ", (arrow.utcnow()-t0).total_seconds()*1000)

        t0 = arrow.utcnow()
        new_edges = self.edgeSimilarityFast(matrix_scores, X, edges, edges_norm, adj_fake, th=th_edges_similarity)
        #new_edges = self.edgeSimilarity(points, edges, points_dirs)
        if debug: print("time edges similarity: ", (arrow.utcnow()-t0).total_seconds()*1000)


        ############################
        if debug:
            nodes_nx = [(it, {"pos": x}) for it, x in enumerate(points)]

            fig, ax1 = plt.subplots(1, 1, figsize=(9, 6))

            gnew = nx.Graph()
            gnew.add_nodes_from(nodes_nx)
            gnew.add_edges_from(new_edges, label=0)
            ax1.imshow(dist_img)
            nx.draw(gnew, pos={k: (n["pos"][1], n["pos"][0]) for k, n in gnew.nodes(data=True)}, node_size=50, 
                            alpha=0.8, linewidths=2.0, width=2.0)
            for k, n in gnew.nodes(data=True):
                ax1.text(n["pos"][1], n["pos"][0], k, fontsize=6, ha='center', va='center', color="white")
            
            plt.tight_layout(pad=0.1)
            plt.show()

        return points, new_edges, points_dirs, points_maxmask
