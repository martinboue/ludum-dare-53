# Gunner
extends CharacterBody2D

@onready var fire_cooldown := $FireCooldown
@onready var bullet_spawner := $BulletSpawner

var target: Node2D
var bullet_scene := preload("res://src/actors/bullet/bullet.tscn")
var blood_scene := preload("res://src/actors/enemies/blood/blood.tscn")

var shooting_distance = 500.0
var is_active := false
var is_triggered := true

signal activated

func _ready() -> void:
	set_physics_process(false)
	target = get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta: float) -> void:
	look_at(target.global_position)
	
	if is_active and is_triggered and can_shoot():
		velocity = Vector2.ZERO
		if fire_cooldown.is_stopped():
			fire_cooldown.start()
			var tween = create_tween().set_loops(3)
			tween.tween_callback(fire).set_delay(0.1)

func can_shoot() -> bool:
	return target.global_position.distance_to(global_position) < shooting_distance

func fire() -> void:
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.source = bullet_spawner
	bullet.target_position = target.global_position
	add_child(bullet)
	
func activate():
	is_active = true
	set_physics_process(true)
	activated.emit()

func _on_health_died() -> void:
	var blood: Blood = blood_scene.instantiate()
	blood.global_position = global_position
	get_parent().add_child(blood)
	queue_free()
