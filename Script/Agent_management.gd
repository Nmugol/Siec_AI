extends Node2D

@onready var Agent_sece = preload("res://Scenes/agent.tscn")

func _ready():
	for i in range(DataInput.how_many_agent):
		var agent_instance = Agent_sece.instantiate()
		
		# Position an object
		agent_instance.position.x = randf_range(DataInput.spritr_radius,DataInput.widow_size.x-DataInput.spritr_radius)
		agent_instance.position.y = randf_range(DataInput.spritr_radius,DataInput.widow_size.y-DataInput.spritr_radius)
		
		# Set object name
		agent_instance.name = str(i)
		
		# Add an object to a scene
		add_child(agent_instance)
		SaveData.add_agent_to_list(agent_instance.name.to_int())
	pass # Replace with function body.