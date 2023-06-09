@icon("icon.svg")
class_name HurtBox
extends Area2D

signal on_hurt(hitbox: HitBox)

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if not area is HitBox: 
		return
	var hitbox : HitBox = area
	
	on_hurt.emit(hitbox)
	hitbox.hit.emit()
