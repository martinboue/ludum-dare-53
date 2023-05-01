class_name Trailer
extends RigidBody2D

@export var has_rambo := false
@onready var rambo := $Rambo

func _ready() -> void:
	if get_parent() is RigidBody2D:
		$PinJoint2D.node_a = get_parent().get_path()
	if not has_rambo:
		$Rambo.queue_free()

