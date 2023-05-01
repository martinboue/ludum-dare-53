class_name Car
extends RigidBody2D

@export var health : Health

# Steering wheel = roue directrice
@onready var steering_wheel := $SteeringWheel
# DriveWheel = roue motrice
@onready var drive_wheel := $DriveWheel

@onready var drifter = $Drifter
@onready var right_wheel = $RightWheel
@onready var left_wheel = $LeftWheel

# Damage
const impact_force_to_damage := 100000.0
const min_damage := 20

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

var steer_velocity := 0.08
var prev_linear_velocity := Vector2.ZERO

func _ready() -> void:
	if health != null:
		contact_monitor = true
		max_contacts_reported = 1
		body_entered.connect(on_body_entered)

func _physics_process(_delta):
	# Acceleration
	apply_impulse(transform.x * engine_power * acceleration, 
		drive_wheel.position.rotated(rotation))

	# Steering
	var steer_direction = clampf(turn, -max_steering_angle, max_steering_angle)
	apply_torque(steer_direction * steer_power * linear_velocity.length() / steer_scale)
	left_wheel.rotation = move_toward(left_wheel.rotation, steer_direction, steer_velocity)
	right_wheel.rotation = move_toward(right_wheel.rotation, steer_direction, steer_velocity)
	
	# Store linear velocity before impact
	# for computing collision strengh
	prev_linear_velocity = linear_velocity
	
func on_body_entered(body: Node) -> void:
	# Do not take damage from his trailer
	if body == trailer:
		return
		
	var body_velocity : Vector2
	if body is Car:
		body_velocity = body.prev_linear_velocity
	else:
		body_velocity = Vector2.ZERO
		
	var body_mass: float
	if body is RigidBody2D:
		body_mass = body.mass
	else:
		body_mass = mass
	
	# Compute speed from a to b
	var speed = abs(prev_linear_velocity.x - body_velocity.x) + abs(prev_linear_velocity.y - body_velocity.y)
	
	# Impact force on self = (mass / 2) * velocity^2
	var impact_force := (body_mass / 2.0) * pow(speed, 2)
	var damage := floori(impact_force / impact_force_to_damage) - min_damage
	
	if damage > 0:
		health.damage(damage)

