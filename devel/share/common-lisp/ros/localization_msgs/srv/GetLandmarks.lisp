; Auto-generated. Do not edit!


(cl:in-package localization_msgs-srv)


;//! \htmlinclude GetLandmarks-request.msg.html

(cl:defclass <GetLandmarks-request> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (width_meter
    :reader width_meter
    :initarg :width_meter
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (heigth_meter
    :reader heigth_meter
    :initarg :heigth_meter
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64)))
)

(cl:defclass GetLandmarks-request (<GetLandmarks-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetLandmarks-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetLandmarks-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_msgs-srv:<GetLandmarks-request> is deprecated: use localization_msgs-srv:GetLandmarks-request instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <GetLandmarks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:point-val is deprecated.  Use localization_msgs-srv:point instead.")
  (point m))

(cl:ensure-generic-function 'width_meter-val :lambda-list '(m))
(cl:defmethod width_meter-val ((m <GetLandmarks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:width_meter-val is deprecated.  Use localization_msgs-srv:width_meter instead.")
  (width_meter m))

(cl:ensure-generic-function 'heigth_meter-val :lambda-list '(m))
(cl:defmethod heigth_meter-val ((m <GetLandmarks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:heigth_meter-val is deprecated.  Use localization_msgs-srv:heigth_meter instead.")
  (heigth_meter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetLandmarks-request>) ostream)
  "Serializes a message object of type '<GetLandmarks-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'width_meter) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'heigth_meter) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetLandmarks-request>) istream)
  "Deserializes a message object of type '<GetLandmarks-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'width_meter) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'heigth_meter) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetLandmarks-request>)))
  "Returns string type for a service object of type '<GetLandmarks-request>"
  "localization_msgs/GetLandmarksRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetLandmarks-request)))
  "Returns string type for a service object of type 'GetLandmarks-request"
  "localization_msgs/GetLandmarksRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetLandmarks-request>)))
  "Returns md5sum for a message object of type '<GetLandmarks-request>"
  "06cc287e6db3b6bdd1132d19203493c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetLandmarks-request)))
  "Returns md5sum for a message object of type 'GetLandmarks-request"
  "06cc287e6db3b6bdd1132d19203493c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetLandmarks-request>)))
  "Returns full string definition for message of type '<GetLandmarks-request>"
  (cl:format cl:nil "geometry_msgs/Point point~%std_msgs/Float64 width_meter~%std_msgs/Float64 heigth_meter~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetLandmarks-request)))
  "Returns full string definition for message of type 'GetLandmarks-request"
  (cl:format cl:nil "geometry_msgs/Point point~%std_msgs/Float64 width_meter~%std_msgs/Float64 heigth_meter~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetLandmarks-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'width_meter))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'heigth_meter))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetLandmarks-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetLandmarks-request
    (cl:cons ':point (point msg))
    (cl:cons ':width_meter (width_meter msg))
    (cl:cons ':heigth_meter (heigth_meter msg))
))
;//! \htmlinclude GetLandmarks-response.msg.html

(cl:defclass <GetLandmarks-response> (roslisp-msg-protocol:ros-message)
  ((landmarks
    :reader landmarks
    :initarg :landmarks
    :type (cl:vector localization_msgs-msg:Landmark)
   :initform (cl:make-array 0 :element-type 'localization_msgs-msg:Landmark :initial-element (cl:make-instance 'localization_msgs-msg:Landmark))))
)

(cl:defclass GetLandmarks-response (<GetLandmarks-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetLandmarks-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetLandmarks-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_msgs-srv:<GetLandmarks-response> is deprecated: use localization_msgs-srv:GetLandmarks-response instead.")))

(cl:ensure-generic-function 'landmarks-val :lambda-list '(m))
(cl:defmethod landmarks-val ((m <GetLandmarks-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:landmarks-val is deprecated.  Use localization_msgs-srv:landmarks instead.")
  (landmarks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetLandmarks-response>) ostream)
  "Serializes a message object of type '<GetLandmarks-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'landmarks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'landmarks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetLandmarks-response>) istream)
  "Deserializes a message object of type '<GetLandmarks-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'landmarks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'landmarks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'localization_msgs-msg:Landmark))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetLandmarks-response>)))
  "Returns string type for a service object of type '<GetLandmarks-response>"
  "localization_msgs/GetLandmarksResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetLandmarks-response)))
  "Returns string type for a service object of type 'GetLandmarks-response"
  "localization_msgs/GetLandmarksResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetLandmarks-response>)))
  "Returns md5sum for a message object of type '<GetLandmarks-response>"
  "06cc287e6db3b6bdd1132d19203493c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetLandmarks-response)))
  "Returns md5sum for a message object of type 'GetLandmarks-response"
  "06cc287e6db3b6bdd1132d19203493c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetLandmarks-response>)))
  "Returns full string definition for message of type '<GetLandmarks-response>"
  (cl:format cl:nil "Landmark[] landmarks~%~%~%~%~%================================================================================~%MSG: localization_msgs/Landmark~%uint8 id~%float64 pos_x~%float64 pos_y~%float64 pos_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetLandmarks-response)))
  "Returns full string definition for message of type 'GetLandmarks-response"
  (cl:format cl:nil "Landmark[] landmarks~%~%~%~%~%================================================================================~%MSG: localization_msgs/Landmark~%uint8 id~%float64 pos_x~%float64 pos_y~%float64 pos_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetLandmarks-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'landmarks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetLandmarks-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetLandmarks-response
    (cl:cons ':landmarks (landmarks msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetLandmarks)))
  'GetLandmarks-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetLandmarks)))
  'GetLandmarks-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetLandmarks)))
  "Returns string type for a service object of type '<GetLandmarks>"
  "localization_msgs/GetLandmarks")