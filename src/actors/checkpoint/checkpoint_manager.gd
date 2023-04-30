class_name CheckpointManager
extends Node2D

@export var initial_checkpoint: Checkpoint

func _ready() -> void:
	begin_checkpoint(initial_checkpoint, null)

func on_checkpoint_confirmed(trailer: Trailer, checkpoint: Checkpoint) -> void:
	var next_checkpoint = checkpoint.next_checkpoint
	
	begin_checkpoint(next_checkpoint, trailer)
	
	checkpoint.stop()

func begin_checkpoint(checkpoint: Checkpoint, trailer: Trailer) -> void:
	if checkpoint != null:
		checkpoint.confirmed.connect(on_checkpoint_confirmed.bind(checkpoint))
		checkpoint.begin()
	
	if checkpoint == null:
		owner.won.emit()
	elif trailer == null:
		owner.new_objective.emit("Move your ass and go get your cargo!")
	else:
		owner.new_objective.emit("Get out of here! You've got a delivery")
	
