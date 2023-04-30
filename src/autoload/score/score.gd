extends Node

# Weights
const unkilled_enemy_weight := 10
const damage_received_weight := 1
const timer_weight := 1

# Score
var time := 0.0
var unkilled_enemies := 0
var damages_received := 0

func _ready() -> void:
	set_process(false)

func start() -> void:
	set_process(true)
	time = 0.0

func stop() -> void:
	set_process(false)
	# Compute the number of unkilled enemies
	unkilled_enemies = get_tree().get_nodes_in_group("enemy").size()

func add_damage_received(damage: int) -> void:
	damages_received += damage
	
func _process(delta: float) -> void:
	time += delta

func get_unkilled_enemies_score() -> int:
	return - unkilled_enemies * unkilled_enemy_weight

func get_damages_received_score() -> int:
	return - damages_received * damage_received_weight

func get_time_score() -> int:
	return - floori(time) * timer_weight

func get_total_score() -> int:
	return ( 
		get_unkilled_enemies_score()
		+ get_damages_received_score()
		+ get_time_score()
	)
