extends Area2D

var frame_counter:int = 0

func _process(delta):
	if frame_counter == DataInput.how_many_frame:
		SaveData.add_meal_position(self.position)
		pass
	frame_counter+=1
	pass


# If the subject has entered a meal
func _on_body_entered(body):
	
	#Verify that an object is an agent
	if body.is_in_group("agent"):
		SaveData.add_eaten_meals(body.name.to_int())
		#Remove a meal from a scene
		queue_free()
	pass
