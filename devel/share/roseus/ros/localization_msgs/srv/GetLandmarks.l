;; Auto-generated. Do not edit!


(when (boundp 'localization_msgs::GetLandmarks)
  (if (not (find-package "LOCALIZATION_MSGS"))
    (make-package "LOCALIZATION_MSGS"))
  (shadow 'GetLandmarks (find-package "LOCALIZATION_MSGS")))
(unless (find-package "LOCALIZATION_MSGS::GETLANDMARKS")
  (make-package "LOCALIZATION_MSGS::GETLANDMARKS"))
(unless (find-package "LOCALIZATION_MSGS::GETLANDMARKSREQUEST")
  (make-package "LOCALIZATION_MSGS::GETLANDMARKSREQUEST"))
(unless (find-package "LOCALIZATION_MSGS::GETLANDMARKSRESPONSE")
  (make-package "LOCALIZATION_MSGS::GETLANDMARKSRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass localization_msgs::GetLandmarksRequest
  :super ros::object
  :slots (_point _width_meter _heigth_meter ))

(defmethod localization_msgs::GetLandmarksRequest
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

(defclass localization_msgs::GetLandmarksResponse
  :super ros::object
  :slots (_landmarks ))

(defmethod localization_msgs::GetLandmarksResponse
  (:init
   (&key
    ((:landmarks __landmarks) (let (r) (dotimes (i 0) (push (instance localization_msgs::Landmark :init) r)) r))
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
    ;; localization_msgs/Landmark[] _landmarks
    (apply #'+ (send-all _landmarks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; localization_msgs/Landmark[] _landmarks
     (write-long (length _landmarks) s)
     (dolist (elem _landmarks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; localization_msgs/Landmark[] _landmarks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _landmarks (let (r) (dotimes (i n) (push (instance localization_msgs::Landmark :init) r)) r))
     (dolist (elem- _landmarks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass localization_msgs::GetLandmarks
  :super ros::object
  :slots ())

(setf (get localization_msgs::GetLandmarks :md5sum-) "06cc287e6db3b6bdd1132d19203493c2")
(setf (get localization_msgs::GetLandmarks :datatype-) "localization_msgs/GetLandmarks")
(setf (get localization_msgs::GetLandmarks :request) localization_msgs::GetLandmarksRequest)
(setf (get localization_msgs::GetLandmarks :response) localization_msgs::GetLandmarksResponse)

(defmethod localization_msgs::GetLandmarksRequest
  (:response () (instance localization_msgs::GetLandmarksResponse :init)))

(setf (get localization_msgs::GetLandmarksRequest :md5sum-) "06cc287e6db3b6bdd1132d19203493c2")
(setf (get localization_msgs::GetLandmarksRequest :datatype-) "localization_msgs/GetLandmarksRequest")
(setf (get localization_msgs::GetLandmarksRequest :definition-)
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
MSG: localization_msgs/Landmark
uint8 id
float64 pos_x
float64 pos_y
float64 pos_z
")

(setf (get localization_msgs::GetLandmarksResponse :md5sum-) "06cc287e6db3b6bdd1132d19203493c2")
(setf (get localization_msgs::GetLandmarksResponse :datatype-) "localization_msgs/GetLandmarksResponse")
(setf (get localization_msgs::GetLandmarksResponse :definition-)
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
MSG: localization_msgs/Landmark
uint8 id
float64 pos_x
float64 pos_y
float64 pos_z
")



(provide :localization_msgs/GetLandmarks "06cc287e6db3b6bdd1132d19203493c2")


