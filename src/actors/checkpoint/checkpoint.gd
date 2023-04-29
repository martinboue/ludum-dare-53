extends Area2D

var trailer_scene := preload("res://src/actors/trailer/trailer.tscn")

@onready var polygon = $Polygon2D


func _ready() -> void:
	# Highlight/blink checkpoint
	var tween = create_tween()
	tween.tween_property(polygon, "modulate:a", 0.1, 1.0)
	tween.tween_property(polygon, "modulate:a", 0.7, 1.0)
	tween.set_loops()

func _on_body_entered(body: Node2D) -> void:
	if not body is Car:
		return
	
	if body.trailer == null:
		load_trailer(body)
	else:
		unload_trailer(body)

	# Disable checkpoint
	set_deferred("monitoring", false)
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 2.0)
	tween.tween_callback(queue_free)

func load_trailer(car: Car) -> void:
	var trailer := trailer_scene.instantiate()
	trailer.position = Vector2(-59, 0)
	car.trailer = trailer
	car.call_deferred("add_child", trailer)

func unload_trailer(car: Car) -> void:
	var trailer = car.trailer
	car.trailer = null
	trailer.queue_free()
