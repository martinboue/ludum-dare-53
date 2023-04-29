extends Node

func _physics_process(_delta):
	drive_car()

func drive_car():
	var car_to_pilot = get_parent()
	if car_to_pilot is Car:
		car_to_pilot.acceleration = Input.get_axis("brake", "accelerate")
		car_to_pilot.turn = Input.get_axis("steer_left", "steer_right") * deg_to_rad(car_to_pilot.max_steering_angle)
