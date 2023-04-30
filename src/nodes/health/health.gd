class_name Health
extends Node

signal died()
signal health_changed(health: int)
signal max_health_changed(max_health: int)
signal damaged(damage: int)

@export var max_health := 100
@export var hurt_box : HurtBox

var health := 100 : set = set_health

func _ready() -> void:
	max_health_changed.emit(max_health)
	set_health(max_health)
	hurt_box.on_hurt.connect(on_hurtbox_hurt)

func on_hurtbox_hurt(hitbox: HitBox) -> void:
	damage(hitbox.damage)

func damage(amount: int) -> void:
	set_health(health - amount)
	damaged.emit(amount)

func set_health(new_health: int) -> void:
	if is_dead():
		return 
	
	health = new_health
	health_changed.emit(health)
	
	if is_dead():
		health = 0
		died.emit()
	
func is_dead() -> bool:
	return health <= 0

func is_alive() -> bool:
	return not is_dead()
