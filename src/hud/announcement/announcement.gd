# Announcement
extends Label

func _ready() -> void:
	modulate.a = 0.0

func display(new_text: String) -> void:
	text = new_text
	modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 2).set_delay(5)
