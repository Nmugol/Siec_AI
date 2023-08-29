extends RigidBody2D

@export var speed = 100  # Prędkość przeciwnika
@export var eat_meal = 0

var widow_size= DisplayServer.window_get_size()

var direction = Vector2.ZERO  # Kierunek ruchu przeciwnika
var change_direction_interval = 2.0  # Interwał zmiany kierunku w sekundach
var time_since_direction_change = 2.0  # Czas od ostatniej zmiany kierunku

func _physics_process(delta):
	# Aktualizujemy czas od ostatniej zmiany kierunku
	time_since_direction_change += delta
	
	# Jeśli czas od ostatniej zmiany kierunku przekroczył interwał, losujemy nowy kierunek
	var boarder_x:bool = position.x <= 32 or position.x >= widow_size.x-32
	var boarder_y:bool = position.y <= 32 or position.y >= widow_size.y-32
	if time_since_direction_change >= change_direction_interval or boarder_x or boarder_y:
		change_direction()
		time_since_direction_change = 0.0
	
	# Przesuwamy przeciwnika
	move_and_collide(direction * speed * delta)

func change_direction():
	# Losujemy losowy kierunek z listy dostępnych kierunków (8 kierunków)
	var random_direction = Vector2(randi_range(-1, 1), randi_range(-1, 1))
	
	# Normalizujemy kierunek, aby uzyskać stałą prędkość
	direction = random_direction.normalized()
