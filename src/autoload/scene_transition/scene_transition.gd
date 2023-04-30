# SceneTransition
extends CanvasLayer

@onready var anim_player = $AnimationPlayer

func change_scene(scene_path: String) -> void:
	anim_player.play("fade")
	await anim_player.animation_finished
	get_tree().change_scene_to_file(scene_path)
	anim_player.play_backwards("fade")
	await anim_player.animation_finished
	
