class_name Drifter
extends Marker2D

@export var min_speed := 20

const min_drift_angle := 30.0

var drift_mark_scene := preload("res://src/actors/car/drift/drift_mark.tscn")

var body: RigidBody2D
var current_mark: DriftMark = null

func _ready() -> void:
	body = owner
	show_behind_parent = true

func _physics_process(delta: float) -> void:
	# Compute angle difference between where the car is going and where it is facing 
	var angle_diff = abs(rad_to_deg(body.transform.x.angle_to(body.linear_velocity)))
	# Stop drift when too slow or not turning
	if body.linear_velocity.length() < min_speed or angle_diff < min_drift_angle:
		if current_mark != null:
			current_mark.stop()
			current_mark = null
		return
	
	if current_mark == null:
		current_mark = drift_mark_scene.instantiate()
		add_child(current_mark)
