extends CharacterBody2D

# Distant between 2 wheels in pixels
var wheel_base = 35
# Maximum steering angle of front wheel in degrees
var max_steering_angle = 15
var engine_power = 800
var friction = -0.9
var drag = -0.001
var acceleration = Vector2.ZERO
var steer_direction

func _physics_process(delta):
	acceleration = Vector2.ZERO
	get_input()
	apply_friction()
	calculate_steering(delta)
	velocity += acceleration * delta
	move_and_slide()
	
func get_input():
	var turn := Input.get_axis("steer_left", "steer_right")
	steer_direction = turn * deg_to_rad(max_steering_angle)
	
	if Input.is_action_pressed("accelerate"):
		acceleration = transform.x * engine_power
		
func apply_friction():
	if velocity.length() < 5:
		velocity = Vector2.ZERO
	var friction_force = velocity * friction
	var drag_force = velocity * velocity.length() * drag
	acceleration += drag_force + friction_force
	
func calculate_steering(delta):
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	var new_heading = (front_wheel - rear_wheel).normalized()
	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()
