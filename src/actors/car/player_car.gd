# Player car
extends Car

func _on_health_damaged(damage: int) -> void:
	Score.add_damage_received(damage)
