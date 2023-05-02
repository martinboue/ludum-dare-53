class_name EngineSound
extends Node2D

@export var max_speed := 1000
@export var enabled := true
@export var wheel: Node2D

var body: RigidBody2D

@onready var engine_audio := $EngineAudio
@onready var drift_audio := $DriftAudio

const drift_audio_angle := 60
const drift_audio_speed := 200
const min_pitch := 0.1

func _ready() -> void:
	body = owner
	
	engine_audio.playing = enabled
	engine_audio.volume_db = linear_to_db(0.0)
	drift_audio.playing = enabled
	drift_audio.volume_db = linear_to_db(0.0)

func _process(_delta: float) -> void:
	var speed := body.linear_velocity.length() / max_speed + min_pitch
	engine_audio.pitch_scale = speed + min_pitch
	engine_audio.volume_db = linear_to_db(1.0)
	
	# Compute angle difference between where the car is going and where it is facing 
	var angle_diff = abs(rad_to_deg(body.transform.x.angle_to(body.linear_velocity)))
	
	if angle_diff >= drift_audio_angle and body.linear_velocity.length() > drift_audio_speed:
		drift_audio.volume_db = linear_to_db(move_toward(db_to_linear(drift_audio.volume_db), 0.5, 0.05))
	else:
		drift_audio.volume_db = linear_to_db(move_toward(db_to_linear(drift_audio.volume_db), 0.0, 0.05))

# returns the difference (in degrees) between angle1 and angle 2
# the given angles must be in the range [0, 360)
# the returned value is in the range (-180, 180]
func angle_difference(angle1, angle2):
	var diff = angle2 - angle1
	return diff if abs(diff) < 180 else diff + (360 * -sign(diff))

func _on_player_car_died() -> void:
	$ExplosionAudio.play()
