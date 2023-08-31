extends Node2D

@onready var Meal = preload("res://Scenes/meal.tscn")

func _ready():
	for i in range(DataInput.how_many_meal):
		var meal_instance = Meal.instantiate()
		
		# Position an object
		meal_instance.position.x = randf_range(DataInput.spritr_radius,DataInput.widow_size.x-DataInput.spritr_radius)
		meal_instance.position.y = randf_range(DataInput.spritr_radius,DataInput.widow_size.y-DataInput.spritr_radius)
		
		# Set object name
		meal_instance.name = "meal"+str(i)
		
		# Add an object to a scene
		add_child(meal_instance)
	pass
