class_name Bullet
extends CharacterBody2D

@onready var anim_player := $AnimationPlayer
@onready var hitbox := $HitBox

var target_position: Vector2
var source: Node2D
var is_friendly := false

const speed := 1200

func _ready() -> void:
	# Initial position
	global_position = source.global_position
	# Initial rotation
	look_at(target_position)
	# Initial velocity
	velocity = source.global_position.direction_to(target_position) * speed
	
	if is_friendly:
		set_bullet_friendly()
		
func set_bullet_friendly() -> void:
	# collide with enemy instead of player
	hitbox.set_collision_layer_value(2, true)
	hitbox.set_collision_layer_value(3, false)

func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func _on_hit_box_hit() -> void:
	set_physics_process(false)
	anim_player.play("explode")


