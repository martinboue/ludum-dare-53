extends Node

@export var car_to_pilot : Car
@export var target : Car

func _physics_process(_delta):
	car_to_pilot.acceleration = 1
	car_to_pilot.turn = car_to_pilot.get_angle_to(target.global_position)
