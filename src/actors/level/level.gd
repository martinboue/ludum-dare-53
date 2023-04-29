extends Node2D

@onready var curve = $Path2D.curve
@onready var line = $Line2D

func _ready():
	line.points = curve.tessellate()
