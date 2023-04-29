extends Node2D

var drift_marker_scene = preload("res://src/actors/drift_mark.tscn")

@onready var timer = $Timer

func drift():
	var current_drift_marks = get_tree().get_nodes_in_group("drift_marks")
	if current_drift_marks.is_empty():
		add_four_wheels_drift_marks()
	
	get_tree().call_group("drift_marks", "mark")

func stop_drit():
	remove_four_wheels_drift_marks()
	
	
func add_four_wheels_drift_marks():
	for m in get_tree().get_nodes_in_group("wheel_markers"):
		add_drift_marker(m)
		
func add_drift_marker(marker: Marker2D):
	var drift_marker = drift_marker_scene.instantiate()
	drift_marker.position = marker.position
	add_child(drift_marker)
	drift_marker.add_to_group("drift_marks")

func remove_four_wheels_drift_marks():
	for m in get_tree().get_nodes_in_group("drift_marks"):
		m.end_mark()
		m.remove_from_group("drift_marks")
