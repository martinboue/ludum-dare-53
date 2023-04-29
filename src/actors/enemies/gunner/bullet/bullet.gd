class_name Bullet
extends CharacterBody2D

@onready var anim_player := $AnimationPlayer

var target: Node2D
var source: Node2D

const speed := 1200

func _ready() -> void:
	# Initial position
	global_position = source.global_position
	# Initial rotation
	look_at(target.global_position)
	# Initial velocity
	velocity = source.global_position.direction_to(target.global_position) * speed

func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func _on_hit_box_hit() -> void:
	set_physics_process(false)
	anim_player.play("explode")
