# Gunner
extends CharacterBody2D

const speed := 100.0
const stop_distance := 500.0

@onready var fire_cooldown := $FireCooldown
@onready var bullet_spawner := $BulletSpawner

var target: Node2D
var bullet_scene := preload("res://src/actors/enemies/gunner/bullet/bullet.tscn")

func _ready() -> void:
	target = get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta: float) -> void:
	look_at(target.global_position)
	
	var dist := target.global_position.distance_to(global_position)
	if dist > stop_distance:
		velocity = speed * global_position.direction_to(target.global_position)
	else:
		velocity = Vector2.ZERO
		if fire_cooldown.is_stopped():
			fire()

	move_and_slide()

func fire() -> void:
	fire_cooldown.start()
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.source = bullet_spawner
	bullet.target = target
	add_child(bullet)
	


func _on_hurt_box_on_hurt(_hitbox) -> void:
	queue_free()
