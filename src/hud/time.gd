extends Label

func _process(_delta: float):
	text = format(Score.time)

func format(time: float) -> String:
	return "%d:%02d" % [floor(time / 60), int(time) % 60]
