# Main menu
extends Control


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed() -> void:
	print("Start loading: ", Time.get_ticks_msec())
	get_tree().change_scene_to_file("res://src/level/level.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
