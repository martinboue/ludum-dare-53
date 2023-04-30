extends Node

@export var speed := 1.0

var target: Node2D
var car_to_pilot: Car

var is_active := false
var is_triggered := true

signal activated

func _ready():
	target = get_tree().get_nodes_in_group("player")[0]
	car_to_pilot = get_parent()

func _physics_process(_delta) -> void:
	if car_to_pilot == null or not is_active or not is_triggered:
		return 
	car_to_pilot.acceleration = speed
	car_to_pilot.turn = car_to_pilot.get_angle_to(target.global_position)

func activate():
	is_active = true
	activated.emit()

func _on_health_died() -> void:
	set_physics_process(false)
	if car_to_pilot != null: 
		car_to_pilot.acceleration = 0.0
		car_to_pilot.turn = 0.0
