extends Car

var is_active := false
var is_triggered := true

signal activated

func _physics_process(delta): 
	if not is_active or not is_triggered:
		return
	super._physics_process(delta)
		
func activate():
	is_active = true
	activated.emit()

func _on_health_died() -> void:
	$ExplosionAudio.play()
