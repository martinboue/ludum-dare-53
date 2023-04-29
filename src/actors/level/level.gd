extends Node2D

signal new_objective(text: String)
signal won()

@onready var curve = $Path2D.curve
@onready var line = $Line2D

func _ready():
	line.points = curve.tessellate()
