extends RigidBody2D

# Variables visible in the inspector


var direction = Vector2.ZERO
var change_direction_interval = DataInput.max_move_time  
var time_since_direction_change = DataInput.max_move_time

func _physics_process(delta):
	
	# Counting a time to change direction 
	time_since_direction_change += delta
	
	# Limiting traffic areas
	var boarder_x:bool = position.x <= DataInput.spritr_radius or position.x >= DataInput.widow_size.x-DataInput.spritr_radius
	var boarder_y:bool = position.y <= DataInput.spritr_radius or position.y >= DataInput.widow_size.y-DataInput.spritr_radius
	
	# Limiting traffic areas
	if time_since_direction_change >= change_direction_interval or boarder_x or boarder_y:
		change_direction()
		
		# Reste timer
		time_since_direction_change = 0.0
		
	# Function responsible for the movement of the object
	move_and_collide(direction * DataInput.speed * delta)
	SaveData.add_agent_position(position.x,position.y,name.to_int())
	

func change_direction():
	# Drawing the direction of movement
	var random_direction = Vector2(randi_range(-1, 1), randi_range(-1, 1))
	
	#Normalized movement
	direction = random_direction.normalized()
