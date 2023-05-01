class_name Drifter
extends Marker2D

@export var min_speed := 20

var drift_mark_scene := preload("res://src/actors/car/drift/drift_mark.tscn")

var body: RigidBody2D
var current_mark: DriftMark = null

func _ready() -> void:
	body = owner
	show_behind_parent = true

func _physics_process(delta: float) -> void:
	if body.linear_velocity.length() < min_speed:
		if current_mark != null:
			current_mark.stop()
			current_mark = null
		return
	
	if current_mark == null:
		current_mark = drift_mark_scene.instantiate()
		add_child(current_mark)
