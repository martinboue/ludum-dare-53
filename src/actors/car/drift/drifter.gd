extends Node2D

var drift_marker_scene = preload("res://src/actors/car/drift/drift_mark.tscn")
var marks_group_name = null

func _ready():
	marks_group_name = str("drift_marks_", get_instance_id())

func drift():
	var current_drift_marks = get_tree().get_nodes_in_group(marks_group_name)
	if current_drift_marks.is_empty():
		add_four_wheels_drift_marks()
	
	get_tree().call_group(marks_group_name, "mark")

func stop_drift():
	pass
	# remove_four_wheels_drift_marks()
	
func add_four_wheels_drift_marks():
	for m in get_children():
		if m is Marker2D:
			add_drift_marker(m)
		
func add_drift_marker(marker: Marker2D):
	var drift_marker = drift_marker_scene.instantiate()
	drift_marker.position = marker.position
	add_child(drift_marker)
	drift_marker.add_to_group(marks_group_name)

func remove_four_wheels_drift_marks():
	for m in get_tree().get_nodes_in_group(marks_group_name):
		m.end_mark()
		m.remove_from_group(marks_group_name)
