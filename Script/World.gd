extends Node2D

# Variables visible in the inspector
@export var how_many_agent:int = 16
@export var how_many_meal:int = 4

# Global variables

var spritr_radius:int = 32

func _ready():
	
	# Limited to 1 frame per second
	Engine.max_fps=1
	emit_signal("Add_agents",how_many_agent,spritr_radius)
	emit_signal("Add_meals",how_many_meal,spritr_radius)
