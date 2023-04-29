extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func display() -> void:
	await get_tree().create_timer(5).timeout
	visible = true
