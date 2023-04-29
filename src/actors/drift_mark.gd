extends Marker2D

const Max = 200

@onready var line = $Line

func _process(delta):
	var point_count = line.get_point_count()
	if point_count > Max:
		line.remove_point(0)

func mark():
	line.add_point(global_position)	
	
func end_mark():
	var tween := create_tween()
	tween.tween_property(line, "modulate:a", 0, 1).set_delay(5)
	tween.tween_callback(queue_free)

	
