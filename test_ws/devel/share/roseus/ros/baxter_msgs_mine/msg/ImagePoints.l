;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::ImagePoints)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'ImagePoints (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::IMAGEPOINTS")
  (make-package "BAXTER_MSGS_MINE::IMAGEPOINTS"))

(in-package "ROS")
;;//! \htmlinclude ImagePoints.msg.html


(defclass baxter_msgs_mine::ImagePoints
  :super ros::object
  :slots (_sampled_target_points _sampled_current_points _hold_point_coords _pick_point_coords _place_point_coords ))

(defmethod baxter_msgs_mine::ImagePoints
  (:init
   (&key
    ((:sampled_target_points __sampled_target_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sampled_current_points __sampled_current_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:hold_point_coords __hold_point_coords) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pick_point_coords __pick_point_coords) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:place_point_coords __place_point_coords) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _sampled_target_points __sampled_target_points)
   (setq _sampled_current_points __sampled_current_points)
   (setq _hold_point_coords __hold_point_coords)
   (setq _pick_point_coords __pick_point_coords)
   (setq _place_point_coords __place_point_coords)
   self)
  (:sampled_target_points
   (&optional __sampled_target_points)
   (if __sampled_target_points (setq _sampled_target_points __sampled_target_points)) _sampled_target_points)
  (:sampled_current_points
   (&optional __sampled_current_points)
   (if __sampled_current_points (setq _sampled_current_points __sampled_current_points)) _sampled_current_points)
  (:hold_point_coords
   (&optional __hold_point_coords)
   (if __hold_point_coords (setq _hold_point_coords __hold_point_coords)) _hold_point_coords)
  (:pick_point_coords
   (&optional __pick_point_coords)
   (if __pick_point_coords (setq _pick_point_coords __pick_point_coords)) _pick_point_coords)
  (:place_point_coords
   (&optional __place_point_coords)
   (if __place_point_coords (setq _place_point_coords __place_point_coords)) _place_point_coords)
  (:serialization-length
   ()
   (+
    ;; float64[] _sampled_target_points
    (* 8    (length _sampled_target_points)) 4
    ;; float64[] _sampled_current_points
    (* 8    (length _sampled_current_points)) 4
    ;; float64[] _hold_point_coords
    (* 8    (length _hold_point_coords)) 4
    ;; float64[] _pick_point_coords
    (* 8    (length _pick_point_coords)) 4
    ;; float64[] _place_point_coords
    (* 8    (length _place_point_coords)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _sampled_target_points
     (write-long (length _sampled_target_points) s)
     (dotimes (i (length _sampled_target_points))
       (sys::poke (elt _sampled_target_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _sampled_current_points
     (write-long (length _sampled_current_points) s)
     (dotimes (i (length _sampled_current_points))
       (sys::poke (elt _sampled_current_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _hold_point_coords
     (write-long (length _hold_point_coords) s)
     (dotimes (i (length _hold_point_coords))
       (sys::poke (elt _hold_point_coords i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _pick_point_coords
     (write-long (length _pick_point_coords) s)
     (dotimes (i (length _pick_point_coords))
       (sys::poke (elt _pick_point_coords i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _place_point_coords
     (write-long (length _place_point_coords) s)
     (dotimes (i (length _place_point_coords))
       (sys::poke (elt _place_point_coords i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _sampled_target_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sampled_target_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sampled_target_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _sampled_current_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sampled_current_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sampled_current_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _hold_point_coords
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _hold_point_coords (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _hold_point_coords i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _pick_point_coords
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pick_point_coords (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pick_point_coords i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _place_point_coords
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _place_point_coords (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _place_point_coords i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get baxter_msgs_mine::ImagePoints :md5sum-) "d42c80547db6a939e881199410cfe736")
(setf (get baxter_msgs_mine::ImagePoints :datatype-) "baxter_msgs_mine/ImagePoints")
(setf (get baxter_msgs_mine::ImagePoints :definition-)
      "float64[] sampled_target_points
float64[] sampled_current_points
float64[] hold_point_coords
float64[] pick_point_coords
float64[] place_point_coords
")



(provide :baxter_msgs_mine/ImagePoints "d42c80547db6a939e881199410cfe736")


