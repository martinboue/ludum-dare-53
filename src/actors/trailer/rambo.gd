extends Sprite2D

var bullet_scene := preload("res://src/actors/bullet/bullet.tscn")

@onready var cross_sign := $CrossSign
@onready var bullet_spawner := $BulletSpawner
@onready var fire_cooldown := $FireCooldown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_position := get_global_mouse_position()
	look_at(mouse_position)
	$CrossSign.global_position = mouse_position 
	if Input.is_action_just_pressed("shoot") and fire_cooldown.is_stopped():
		fire_cooldown.start()
		create_tween().set_loops(3).tween_callback(fire).set_delay(0.1)

func fire() -> void:
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.source = bullet_spawner
	bullet.target_position = get_global_mouse_position()
	bullet.is_friendly = true
	add_child(bullet)
