extends RigidBody2D


func _ready() -> void:
	if owner is RigidBody2D:
		$PinJoint2D.node_a = owner.get_path()

