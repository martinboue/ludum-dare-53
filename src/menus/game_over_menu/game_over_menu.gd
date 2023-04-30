# Game over menu
extends ColorRect

func _ready() -> void:
	visible = false
	modulate.a = 0

func display() -> void:
	visible = true
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 1.0).set_delay(2.0)
	tween.tween_callback(focus)

func focus() -> void:
	$RestartButton.grab_focus()

func _on_restart_button_pressed() -> void:
	SceneTransition.change_scene("res://main.tscn")
