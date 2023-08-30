extends Node2D

# Scene with objects
@onready var Agent = preload("res://Scenes/agent.tscn")
@onready var Meal = preload("res://Scenes/meal.tscn")

# Variables visible in the inspector
@export var how_many_agent:int = 16
@export var how_many_meal:int = 4

# Global variables
var widow_size= DisplayServer.window_get_size()
var spritr_radius:int = 32

func _ready():
	
	# Limited to 1 frame per second
	Engine.max_fps=1
	
	Agent_adding()
	Meal_adding()

# Function responsible for the appearance of agents on the screen
func Agent_adding():
	for i in range(how_many_agent):
		
		# Setting the position of an object
		var pos = Randoem_position()
		
		var agent_instance = Agent.instantiate()
		
		# Position an object
		agent_instance.position.x = pos.x
		agent_instance.position.y = pos.y
		
		# Set object name
		agent_instance.name = "agent"+str(i+1)
		
		# Add an object to a scene
		add_child(agent_instance)

# Function responsible for the appearance of meals on the screen
func Meal_adding():
	for i in range(how_many_meal):
		
		# Setting the position of an object
		var pos = Randoem_position()
		
		var meal_instance = Meal.instantiate()
		
		# Position an object
		meal_instance.position.x = pos.x
		meal_instance.position.y = pos.y
		
		# Add an object to a scene
		add_child(meal_instance)
	pass

# Function that generates the random position of objects
func Randoem_position(distance:int = spritr_radius)->Vector2:
	var _position:Vector2 = Vector2(0,0)
	_position.x = randf_range(distance,widow_size.x-distance)
	_position.y = randf_range(distance,widow_size.y-distance)
	return _position
