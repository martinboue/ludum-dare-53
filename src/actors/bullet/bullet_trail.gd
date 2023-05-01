extends Line2D

const length = 20

func _physics_process(_delta: float) -> void:
	global_position = Vector2.ZERO
	global_rotation = 0
	
	var point = get_parent().global_position
	add_point(point)
	if get_point_count() > length:
		remove_point(0)
