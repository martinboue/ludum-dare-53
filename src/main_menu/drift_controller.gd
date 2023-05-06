class_name DriftController
extends Node

@export var speed := 1.0

@export var target: Node2D
var car_to_pilot: Car

func _ready():
	car_to_pilot = get_parent()

func _physics_process(_delta) -> void:
	car_to_pilot.acceleration = speed
	car_to_pilot.turn = car_to_pilot.get_angle_to(target.global_position)

func _on_health_died() -> void:
	set_physics_process(false)
	if car_to_pilot != null: 
		car_to_pilot.acceleration = 0.0
		car_to_pilot.turn = 0.0
