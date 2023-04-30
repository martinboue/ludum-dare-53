extends Node

var target: Node2D

func _ready():
	target = get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta):
	var car_to_pilot = get_parent()
	if car_to_pilot is Car: 
		car_to_pilot.acceleration = 1
		car_to_pilot.turn = car_to_pilot.get_angle_to(target.global_position)


func _on_health_died() -> void:
	set_physics_process(false)
	var car_to_pilot = get_parent()
	if car_to_pilot is Car: 
		car_to_pilot.acceleration = 0.0
		car_to_pilot.turn = 0.0
