class_name Car
extends RigidBody2D

# Steering wheel = roue directrice
@onready var steering_wheel := $SteeringWheel
# DriveWheel = roue motrice
@onready var drive_wheel := $DriveWheel

@onready var drifter = $Drifter
@onready var right_wheel = $RightWheel
@onready var left_wheel = $LeftWheel

# Sources :
# https://kidscancode.org/godot_recipes/3.x/kyn/rigidbody2d/

# Distant between 2 wheels in pixels
var wheel_base := 70
# Maximum steering angle of front wheel in degrees
var max_steering_angle := 30.0
var engine_power := 200
var steer_power := 5000
var steer_scale := 400.0

var trailer: Trailer

var acceleration := 0.0
var turn := 0.0

var steer_velocity

func _physics_process(_delta):
	# Acceleration
	apply_impulse(transform.x * engine_power * acceleration, 
		drive_wheel.position.rotated(rotation))
	drifter.drift()

	# Steering
	var steer_direction = clampf(turn, -max_steering_angle, max_steering_angle)
	apply_torque(steer_direction * steer_power * linear_velocity.length() / steer_scale)
	left_wheel.rotation = steer_direction
	right_wheel.rotation = steer_direction
	
	
	

