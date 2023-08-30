extends RigidBody2D

# Variables visible in the inspector
@export var speed = 100  
@export var eat_meal = 0

# # Global variables
var widow_size= DisplayServer.window_get_size()

var direction = Vector2.ZERO
var change_direction_interval = 2.0  
var time_since_direction_change = 2.0  

var spritr_radius:int = 32

func _physics_process(delta):
	
	# Counting a time to change direction 
	time_since_direction_change += delta
	
	# Limiting traffic areas
	var boarder_x:bool = position.x <= spritr_radius or position.x >= widow_size.x-spritr_radius
	var boarder_y:bool = position.y <= spritr_radius or position.y >= widow_size.y-spritr_radius
	
	# Limiting traffic areas
	if time_since_direction_change >= change_direction_interval or boarder_x or boarder_y:
		
		change_direction()
		
		# Reste timer
		time_since_direction_change = 0.0
		
	# Function responsible for the movement of the object
	move_and_collide(direction * speed * delta)

func change_direction():
	# Drawing the direction of movement
	var random_direction = Vector2(randi_range(-1, 1), randi_range(-1, 1))
	
	#Normalized movement
	direction = random_direction.normalized()
