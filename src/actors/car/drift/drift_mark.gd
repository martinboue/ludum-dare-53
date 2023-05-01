class_name DriftMark
extends Line2D

@export var mark_color := Color(0, 0, 0, 0.2)
@export var mark_width := 4

const max = 100

func _ready() -> void:
	default_color = mark_color
	width = mark_width
	show_behind_parent = true

func _process(_delta):
	global_position = Vector2.ZERO
	global_rotation = 0
	
	var point = get_parent().global_position
	add_point(point)
	
	while get_point_count() > max:
		remove_point(0)


	
