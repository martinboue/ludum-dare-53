# Win menu
extends ColorRect

const subtitles := {
	true: [
		"Not bad for a beginner", 
		"I didn't think you could do it",
		"My grandma could have done better"
	],
	false: [
		"Pff, what a loser",
		"I'm not even surprised!", 
		"Remember to open your eyes while driving",
		"Do yourself a favour, stop driving"
	]
}

func _ready() -> void:
	visible = false
	modulate.a = 0

func display() -> void:
	visible = true
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 1.0).set_delay(2.0)
	tween.tween_callback(focus)
	
	$Title.text = "- FINISHED -" if Score.victory else "- FAILED -"
	var subtitles_text = subtitles[Score.victory]
	$SubTitle.text = subtitles_text[randi() % subtitles_text.size()]
	$GridContainer/TimeScore.text = str(Score.get_time_score())
	$GridContainer/UnkilledEnemiesScore.text = str(Score.get_unkilled_enemies_score())
	$GridContainer/DamageReceivedScore.text = str(Score.get_damages_received_score())
	$GridContainer/TotalScore.text = str(Score.get_total_score())

func focus() -> void:
	$RestartButton.grab_focus()

func _on_restart_button_pressed() -> void:
	SceneTransition.change_scene("res://src/main.tscn")
