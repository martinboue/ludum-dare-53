extends Node

@export var trigger_area : Area2D
var controlled_node : Node

func _ready():
	controlled_node = get_parent()
	if trigger_area != null:
		trigger_area.body_entered.connect(_on_trigger_area_entered)
		controlled_node.is_triggered = false

func _on_trigger_area_entered(_body: Node2D):
	if controlled_node.is_active:
		set_controlled_node_triggered()
	else:
		controlled_node.activated.connect(set_controlled_node_triggered)
			
func set_controlled_node_triggered() -> void:
	controlled_node.is_triggered = true
	trigger_area.body_entered.disconnect(_on_trigger_area_entered)
		
