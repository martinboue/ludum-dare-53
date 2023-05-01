class_name CheckpointGuard extends Node

@export var checkpoint : Checkpoint

func _ready() -> void:
	if checkpoint == null:
		printerr("Missing configuration for checkpoint")
		return
	checkpoint.confirmed.connect(_on_checkpoint_confirmed)
	
func _on_checkpoint_confirmed(_trailer: Trailer):
	for c in get_children():
		if c.has_method('activate') :
			c.activate()
	checkpoint.confirmed.disconnect(_on_checkpoint_confirmed)
