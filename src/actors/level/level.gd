class_name Level
extends Node2D

signal new_objective(text: String)
signal won()

func _ready() -> void:
	Score.start(self)

func end() -> void:
	Score.stop()
	won.emit()
