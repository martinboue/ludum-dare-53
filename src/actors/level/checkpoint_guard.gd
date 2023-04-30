class_name CheckpointGuard extends Node

@export var checkpoint : Checkpoint

func _ready() -> void:
	if checkpoint == null:
		printerr("Missing configuration for checkpoint")
		return
	checkpoint.confirmed.connect(_on_checkpoint_confirmed)
	
func _on_checkpoint_confirmed(_trailer: Trailer):
	for c in get_children():
		if 'is_active' in c :
			c.is_active = true
		for d in c.get_children():
			if 'is_active' in d :
				d.is_active = true
	checkpoint.confirmed.disconnect(_on_checkpoint_confirmed)
