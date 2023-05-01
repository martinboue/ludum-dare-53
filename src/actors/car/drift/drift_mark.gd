class_name DriftMark
extends Line2D

const max = 100
var drifting := true
var wait_count = 0

func _ready() -> void:
	show_behind_parent = true

func _physics_process(delta: float) -> void:
	global_position = Vector2.ZERO
	global_rotation = 0
	
	if drifting:
		var point = get_parent().global_position
		add_point(point)
		if get_point_count() > max:
			remove_point(0)
	else:
		if get_point_count() == 0:
			queue_free()
		elif wait_count == 0:
			remove_point(0)
		else: 
			wait_count -= 1

func stop() -> void:
	drifting = false
	wait_count = max - get_point_count()
	
