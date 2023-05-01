class_name Checkpoint
extends Area2D

signal confirmed(trailer: Trailer)

@export var next_checkpoint: Checkpoint
@export var trailer_has_rambo := false
@onready var polygon = $Polygon2D

var trailer_scene := preload("res://src/actors/trailer/trailer.tscn")


func _ready() -> void:
	monitoring = false
	visible = false
	
	# Highlight/blink checkpoint
	var tween = create_tween()
	tween.tween_property(polygon, "modulate:a", 0.1, 1.0)
	tween.tween_property(polygon, "modulate:a", 0.7, 1.0)
	tween.set_loops()
	
func begin() -> void:
	visible = true
	set_deferred("monitoring", true)
	
func stop() -> void:
	set_deferred("monitoring", false)
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 2.0)
	tween.tween_callback(queue_free)

func _on_body_entered(body: Node2D) -> void:
	if not body is Car:
		return
	
	var trailer = body.trailer
	if trailer == null:
		trailer = load_trailer(body)
	else:
		unload_trailer(body, trailer)
		trailer = null

	confirmed.emit(trailer)

func load_trailer(car: Car) -> Trailer:
	var trailer: Trailer = trailer_scene.instantiate()
	trailer.position = Vector2(-59, 0)
	trailer.has_rambo = trailer_has_rambo
	car.trailer = trailer
	car.call_deferred("add_child", trailer)
	return trailer

func unload_trailer(car: Car, trailer: Trailer) -> void:
	car.trailer = null
	trailer.queue_free()
