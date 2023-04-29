@icon("icon.svg")
class_name HitBox
extends Area2D

signal hit()

@export var damage := 1

func _init() -> void:
	# No collision mask
	collision_mask = 0

