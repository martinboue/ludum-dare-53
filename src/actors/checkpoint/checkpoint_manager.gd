class_name CheckpointManager
extends Node2D

@export var initial_checkpoint: Checkpoint

func _ready() -> void:
	begin_checkpoint(initial_checkpoint)

func on_checkpoint_confirmed(trailer: Trailer, checkpoint: Checkpoint) -> void:
	var next_checkpoint = checkpoint.next_checkpoint
	
	if next_checkpoint != null:
		begin_checkpoint(next_checkpoint)
	
	checkpoint.stop()

func begin_checkpoint(checkpoint: Checkpoint) -> void:
	checkpoint.confirmed.connect(on_checkpoint_confirmed.bind(checkpoint))
	checkpoint.begin()
