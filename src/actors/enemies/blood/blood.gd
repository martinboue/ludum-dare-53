class_name Blood extends Sprite2D

func _ready():
	rotation = deg_to_rad(randf_range(0, 360))
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 0, 1).set_delay(5)
	tween.tween_callback(queue_free)

