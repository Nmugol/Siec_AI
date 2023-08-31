extends Area2D

func _ready():
	$Timer.wait_time = DataInput.time_out
	pass


# If the subject has entered a meal
func _on_body_entered(body):
	
	#Verify that an object is an agent
	if body.is_in_group("agent"):
		SaveData.add_eaten_meals(body.name.to_int())
		#Remove a meal from a scene
		queue_free()
	pass


func _on_timer_timeout():
	SaveData.add_meal_position(self.position)
	pass # Replace with function body.
