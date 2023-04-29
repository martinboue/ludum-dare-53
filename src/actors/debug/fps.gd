extends Label

func _process(_delta: float):
	set_text("%d FPS" % Engine.get_frames_per_second())
