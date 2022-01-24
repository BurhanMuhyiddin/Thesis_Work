;; Auto-generated. Do not edit!


(when (boundp 'move_rt::TaskParamUpdate)
  (if (not (find-package "MOVE_RT"))
    (make-package "MOVE_RT"))
  (shadow 'TaskParamUpdate (find-package "MOVE_RT")))
(unless (find-package "MOVE_RT::TASKPARAMUPDATE")
  (make-package "MOVE_RT::TASKPARAMUPDATE"))
(unless (find-package "MOVE_RT::TASKPARAMUPDATEREQUEST")
  (make-package "MOVE_RT::TASKPARAMUPDATEREQUEST"))
(unless (find-package "MOVE_RT::TASKPARAMUPDATERESPONSE")
  (make-package "MOVE_RT::TASKPARAMUPDATERESPONSE"))

(in-package "ROS")





(defclass move_rt::TaskParamUpdateRequest
  :super ros::object
  :slots (_data ))

(defmethod move_rt::TaskParamUpdateRequest
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float64[] _data
    (* 8    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass move_rt::TaskParamUpdateResponse
  :super ros::object
  :slots (_result ))

(defmethod move_rt::TaskParamUpdateResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass move_rt::TaskParamUpdate
  :super ros::object
  :slots ())

(setf (get move_rt::TaskParamUpdate :md5sum-) "ae13d2079549ecafaa66d49d24c80c49")
(setf (get move_rt::TaskParamUpdate :datatype-) "move_rt/TaskParamUpdate")
(setf (get move_rt::TaskParamUpdate :request) move_rt::TaskParamUpdateRequest)
(setf (get move_rt::TaskParamUpdate :response) move_rt::TaskParamUpdateResponse)

(defmethod move_rt::TaskParamUpdateRequest
  (:response () (instance move_rt::TaskParamUpdateResponse :init)))

(setf (get move_rt::TaskParamUpdateRequest :md5sum-) "ae13d2079549ecafaa66d49d24c80c49")
(setf (get move_rt::TaskParamUpdateRequest :datatype-) "move_rt/TaskParamUpdateRequest")
(setf (get move_rt::TaskParamUpdateRequest :definition-)
      "float64[] data
---
bool result

")

(setf (get move_rt::TaskParamUpdateResponse :md5sum-) "ae13d2079549ecafaa66d49d24c80c49")
(setf (get move_rt::TaskParamUpdateResponse :datatype-) "move_rt/TaskParamUpdateResponse")
(setf (get move_rt::TaskParamUpdateResponse :definition-)
      "float64[] data
---
bool result

")



(provide :move_rt/TaskParamUpdate "ae13d2079549ecafaa66d49d24c80c49")


