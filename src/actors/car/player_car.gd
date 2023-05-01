# Player car
extends Car

signal died()

func _on_health_damaged(damage: int) -> void:
	Score.add_damage_received(damage)

func _on_checkpoint_manager_checkpoint_confirmed(_checkpoint_trailer, _checkpoint):
	health.restore_max_health()

func _on_health_died() -> void:
	died.emit()
