# HUD
extends CanvasLayer

@onready var player: Car = get_tree().get_nodes_in_group("player")[0]

func _ready() -> void:
	player.health.health_changed.connect(on_health_changed)
	player.health.max_health_changed.connect(on_max_health_changed)

func on_health_changed(health: int) -> void:
	$LifeBar.value = health

func on_max_health_changed(max_health: int) -> void:
	$LifeBar.max_value = max_health

func _on_level_new_objective(text: String) -> void:
	$Objective.display(text)

func _on_level_finished(_victory: bool) -> void:
	$FinishedMenu.display()
