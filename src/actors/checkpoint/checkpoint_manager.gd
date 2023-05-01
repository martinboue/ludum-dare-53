class_name CheckpointManager
extends Node2D

@export var initial_checkpoint: Checkpoint

signal checkpoint_confirmed(trailer: Trailer, checkpoint: Checkpoint)

func _ready() -> void:
	begin_checkpoint(initial_checkpoint, null)

func on_checkpoint_confirmed(trailer: Trailer, checkpoint: Checkpoint) -> void:
	var next_checkpoint = checkpoint.next_checkpoint
	
	checkpoint_confirmed.emit(trailer, checkpoint)

	owner.new_objective.emit(checkpoint.hint)
	
	begin_checkpoint(next_checkpoint, trailer)

	checkpoint.stop()

func begin_checkpoint(checkpoint: Checkpoint, trailer: Trailer) -> void:
	if checkpoint != null:
		checkpoint.confirmed.connect(on_checkpoint_confirmed.bind(checkpoint))
		checkpoint.begin()
	
	if checkpoint == null:
		owner.end()
	
