extends Node2D

@onready var Agent = preload("res://Scenes/agent.tscn")
@onready var Meal = preload("res://Scenes/meal.tscn")

var widow_size= DisplayServer.window_get_size()

@export var how_many_agent:int = 16
@export var how_many_meal:int = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	Agent_adding()
	Meal_adding()


func Agent_adding():
	for i in range(how_many_agent):
		var pos_x = randf_range(32,widow_size.x-32)
		var pos_y = randf_range(32,widow_size.y-32)
		
		var agent_instance = Agent.instantiate()
		
		agent_instance.position.x = pos_x
		agent_instance.position.y = pos_y
		
		add_child(agent_instance)

func Meal_adding():
	for i in range(how_many_meal):
		var pos_x = randf_range(32,widow_size.x-32)
		var pos_y = randf_range(32,widow_size.y-32)
		
		var meal_instance = Meal.instantiate()
		
		meal_instance.position.x = pos_x
		meal_instance.position.y = pos_y
		
		add_child(meal_instance)

