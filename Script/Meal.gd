extends Area2D

# If the subject has entered a meal
func _on_body_entered(body):
	
	#Verify that an object is an agent
	if body.is_in_group("agent"):
		
		#Remove a meal from a scene
		queue_free()
	pass
