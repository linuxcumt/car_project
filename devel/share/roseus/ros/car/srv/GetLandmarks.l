;; Auto-generated. Do not edit!


(when (boundp 'car::GetLandmarks)
  (if (not (find-package "CAR"))
    (make-package "CAR"))
  (shadow 'GetLandmarks (find-package "CAR")))
(unless (find-package "CAR::GETLANDMARKS")
  (make-package "CAR::GETLANDMARKS"))
(unless (find-package "CAR::GETLANDMARKSREQUEST")
  (make-package "CAR::GETLANDMARKSREQUEST"))
(unless (find-package "CAR::GETLANDMARKSRESPONSE")
  (make-package "CAR::GETLANDMARKSRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass car::GetLandmarksRequest
  :super ros::object
  :slots (_point _width_meter _heigth_meter ))

(defmethod car::GetLandmarksRequest
  (:init
   (&key
    ((:point __point) (instance geometry_msgs::Point :init))
    ((:width_meter __width_meter) (instance std_msgs::Float64 :init))
    ((:heigth_meter __heigth_meter) (instance std_msgs::Float64 :init))
    )
   (send-super :init)
   (setq _point __point)
   (setq _width_meter __width_meter)
   (setq _heigth_meter __heigth_meter)
   self)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:width_meter
   (&rest __width_meter)
   (if (keywordp (car __width_meter))
       (send* _width_meter __width_meter)
     (progn
       (if __width_meter (setq _width_meter (car __width_meter)))
       _width_meter)))
  (:heigth_meter
   (&rest __heigth_meter)
   (if (keywordp (car __heigth_meter))
       (send* _heigth_meter __heigth_meter)
     (progn
       (if __heigth_meter (setq _heigth_meter (car __heigth_meter)))
       _heigth_meter)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ;; std_msgs/Float64 _width_meter
    (send _width_meter :serialization-length)
    ;; std_msgs/Float64 _heigth_meter
    (send _heigth_meter :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;; std_msgs/Float64 _width_meter
       (send _width_meter :serialize s)
     ;; std_msgs/Float64 _heigth_meter
       (send _heigth_meter :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; std_msgs/Float64 _width_meter
     (send _width_meter :deserialize buf ptr-) (incf ptr- (send _width_meter :serialization-length))
   ;; std_msgs/Float64 _heigth_meter
     (send _heigth_meter :deserialize buf ptr-) (incf ptr- (send _heigth_meter :serialization-length))
   ;;
   self)
  )

(defclass car::GetLandmarksResponse
  :super ros::object
  :slots (_landmarks ))

(defmethod car::GetLandmarksResponse
  (:init
   (&key
    ((:landmarks __landmarks) (let (r) (dotimes (i 0) (push (instance car::Landmark :init) r)) r))
    )
   (send-super :init)
   (setq _landmarks __landmarks)
   self)
  (:landmarks
   (&rest __landmarks)
   (if (keywordp (car __landmarks))
       (send* _landmarks __landmarks)
     (progn
       (if __landmarks (setq _landmarks (car __landmarks)))
       _landmarks)))
  (:serialization-length
   ()
   (+
    ;; car/Landmark[] _landmarks
    (apply #'+ (send-all _landmarks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; car/Landmark[] _landmarks
     (write-long (length _landmarks) s)
     (dolist (elem _landmarks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; car/Landmark[] _landmarks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _landmarks (let (r) (dotimes (i n) (push (instance car::Landmark :init) r)) r))
     (dolist (elem- _landmarks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass car::GetLandmarks
  :super ros::object
  :slots ())

(setf (get car::GetLandmarks :md5sum-) "06cc287e6db3b6bdd1132d19203493c2")
(setf (get car::GetLandmarks :datatype-) "car/GetLandmarks")
(setf (get car::GetLandmarks :request) car::GetLandmarksRequest)
(setf (get car::GetLandmarks :response) car::GetLandmarksResponse)

(defmethod car::GetLandmarksRequest
  (:response () (instance car::GetLandmarksResponse :init)))

(setf (get car::GetLandmarksRequest :md5sum-) "06cc287e6db3b6bdd1132d19203493c2")
(setf (get car::GetLandmarksRequest :datatype-) "car/GetLandmarksRequest")
(setf (get car::GetLandmarksRequest :definition-)
      "geometry_msgs/Point point
std_msgs/Float64 width_meter
std_msgs/Float64 heigth_meter

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/Float64
---
Landmark[] landmarks




================================================================================
MSG: car/Landmark
uint8 id
float64 pos_x
float64 pos_y
float64 pos_z
")

(setf (get car::GetLandmarksResponse :md5sum-) "06cc287e6db3b6bdd1132d19203493c2")
(setf (get car::GetLandmarksResponse :datatype-) "car/GetLandmarksResponse")
(setf (get car::GetLandmarksResponse :definition-)
      "geometry_msgs/Point point
std_msgs/Float64 width_meter
std_msgs/Float64 heigth_meter

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/Float64
---
Landmark[] landmarks




================================================================================
MSG: car/Landmark
uint8 id
float64 pos_x
float64 pos_y
float64 pos_z
")



(provide :car/GetLandmarks "06cc287e6db3b6bdd1132d19203493c2")


