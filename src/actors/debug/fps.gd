extends Label

func _process(delta: float):
	set_text("FPS %d" % Engine.get_frames_per_second())
