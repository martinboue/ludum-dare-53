class_name SmokeEmitter
extends Node2D

@export var health: Health
@onready var smoke_particles := $SmokeParticles
@onready var fire_particles := $FireParticles

func _ready() -> void:
	stop()
	health.health_changed.connect(on_health_changed)

func on_health_changed(new_health: int) -> void:
	var hp_percent := new_health / float(health.max_health)
	smoke_particles.emitting = hp_percent <= 0.5
	fire_particles.emitting = hp_percent <= 0.15

func stop() -> void:
	for child in get_children():
		if child is GPUParticles2D:
			child.emitting = false
