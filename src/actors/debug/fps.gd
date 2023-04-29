extends Label

func _process(_delta: float):
	set_text("FPS %d" % Engine.get_frames_per_second())
