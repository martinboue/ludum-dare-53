class_name Level
extends Node2D

signal new_objective(text: String)
signal finished(victory: bool)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Score.start()

func finish(victory: bool) -> void:
	Score.stop(victory)
	finished.emit(victory)

func end() -> void:
	finish(true)

func _on_player_car_died() -> void:
	finish(false)
