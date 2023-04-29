# Rigid car
extends RigidBody2D

# Steering wheel = roue directrice
@onready var steering_wheel := $SteeringWheel
# DriveWheel = roue motrice
@onready var drive_wheel := $DriveWheel

# Sources :
# https://kidscancode.org/godot_recipes/3.x/kyn/rigidbody2d/

# Distant between 2 wheels in pixels
var wheel_base := 70
# Maximum steering angle of front wheel in degrees
var max_steering_angle := 30.0
var engine_power := 100
var steer_power := 5000
var steer_scale := 400.0

var steer_velocity

func _physics_process(delta):
	# Acceleration
	var acceleration := Input.get_axis("brake", "accelerate")
	apply_impulse(transform.x * engine_power * acceleration, 
		drive_wheel.position.rotated(rotation))

	# Steering
	var turn := Input.get_axis("steer_left", "steer_right")
	var steer_direction = turn * deg_to_rad(max_steering_angle)
	apply_torque(steer_direction * steer_power * linear_velocity.length() / steer_scale)
	
	
	

