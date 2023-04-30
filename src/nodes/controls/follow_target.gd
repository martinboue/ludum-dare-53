extends Node

const speed := 100.0
const stop_distance := 500.0

var controlled_node : Node2D
var target: Node2D
var is_near_target := false

func _ready():
	controlled_node = get_parent()
	target = get_tree().get_nodes_in_group("player")[0]
	
func _process(_delta):
	# Don't process if the controlled is not active
	if 'is_active' in controlled_node and not controlled_node.is_active:
		return
	
	if controlled_node.is_triggered and target.global_position.distance_to(controlled_node.global_position) > stop_distance:
		controlled_node.velocity = speed * controlled_node.global_position.direction_to(target.global_position)
		
	controlled_node.move_and_slide()
