;; Auto-generated. Do not edit!


(when (boundp 'car::Landmark)
  (if (not (find-package "CAR"))
    (make-package "CAR"))
  (shadow 'Landmark (find-package "CAR")))
(unless (find-package "CAR::LANDMARK")
  (make-package "CAR::LANDMARK"))

(in-package "ROS")
;;//! \htmlinclude Landmark.msg.html


(defclass car::Landmark
  :super ros::object
  :slots (_id _pos_x _pos_y _pos_z ))

(defmethod car::Landmark
  (:init
   (&key
    ((:id __id) 0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:pos_z __pos_z) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
   (setq _pos_z (float __pos_z))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pos_x
   (&optional __pos_x)
   (if __pos_x (setq _pos_x __pos_x)) _pos_x)
  (:pos_y
   (&optional __pos_y)
   (if __pos_y (setq _pos_y __pos_y)) _pos_y)
  (:pos_z
   (&optional __pos_z)
   (if __pos_z (setq _pos_z __pos_z)) _pos_z)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float64 _pos_x
    8
    ;; float64 _pos_y
    8
    ;; float64 _pos_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float64 _pos_x
       (sys::poke _pos_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pos_y
       (sys::poke _pos_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pos_z
       (sys::poke _pos_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _pos_x
     (setq _pos_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pos_y
     (setq _pos_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pos_z
     (setq _pos_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get car::Landmark :md5sum-) "1b16aee5ecb59828a4f6360391d8b605")
(setf (get car::Landmark :datatype-) "car/Landmark")
(setf (get car::Landmark :definition-)
      "uint8 id
float64 pos_x
float64 pos_y
float64 pos_z

")



(provide :car/Landmark "1b16aee5ecb59828a4f6360391d8b605")


