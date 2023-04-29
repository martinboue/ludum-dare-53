# HUD
extends CanvasLayer

func _on_level_new_objective(text: String) -> void:
	$Objective.display(text)

func _on_level_won() -> void:
	$WinMenu.display()
