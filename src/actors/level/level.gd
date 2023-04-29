extends Node2D

signal new_objective(text: String)

@onready var curve = $Path2D.curve
@onready var line = $Line2D

func _ready():
	line.points = curve.tessellate()
