# Main menu
extends Control


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed() -> void:
	SceneTransition.change_scene("res://main.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
