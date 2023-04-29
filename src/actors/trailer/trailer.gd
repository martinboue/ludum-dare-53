class_name Trailer
extends RigidBody2D

func _ready() -> void:
	if get_parent() is RigidBody2D:
		$PinJoint2D.node_a = get_parent().get_path()
