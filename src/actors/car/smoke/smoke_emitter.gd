class_name SmokeEmitter
extends Node2D

@export var health: Health

func _ready() -> void:
	stop()
	health.health_changed.connect(on_health_changed)

func on_health_changed(new_health: int) -> void:
	if new_health / float(health.max_health) <= 0.2: 
		start()

func start() -> void:
	for child in get_children():
		if child is GPUParticles2D:
			child.emitting = true

func stop() -> void:
	for child in get_children():
		if child is GPUParticles2D:
			child.emitting = false
