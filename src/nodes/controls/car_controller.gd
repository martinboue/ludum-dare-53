extends Node

@export var car : Car

func _physics_process(_delta):
	drive_car()

func drive_car():
	if not car is Car:
		return
	car.acceleration = Input.get_axis("brake", "accelerate")
	car.turn = Input.get_axis("steer_left", "steer_right") * deg_to_rad(car.max_steering_angle)
