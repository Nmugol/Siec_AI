extends Node2D

var generation_nr:int = 0

var how_many_agent:int = 3
var how_many_meal:int = 8

var widow_size= DisplayServer.window_get_size()
var spritr_radius:int = 32

var speed:float = 100.0
var scale_x:float = 1 
var scale_y:float = 1
var next_move:float = 2.0 

var how_many_frame:int = 2

var global_parameters_path:String = "user://global_parameters.txt" 
var entity_parameters_path:String = "user://entity_parameters.txt" 

func _ready():
	# Limited to 1 frame per second
	Engine.max_fps=1
	load_entity_parameters()
	load_global_parameters()
	print(speed,scale_x,scale_y)

func load_entity_parameters():
	print("dupa")
	var entity_parameters = FileAccess.open(entity_parameters_path,FileAccess.READ)
	var line_nr = 1 
	
	while  entity_parameters.get_position() < entity_parameters.get_length():
		var line = entity_parameters.get_line()
		if line_nr > 1:
			var parametr:float = 0
			parametr = get_parametr(line.length(),line).to_float()
			match  line_nr:
				2:
					speed = parametr
				3:
					scale_x = parametr
				4:
					scale_y = parametr
		line_nr += 1
	pass

func load_global_parameters():
	var global_parameters = FileAccess.open(global_parameters_path,FileAccess.READ)
	var line_nr = 1
		
	while global_parameters.get_position() < global_parameters.get_length():
		var line = global_parameters.get_line()
		if line_nr%2 == 0:
			var parametr:int = 0
			parametr = get_parametr(line.length(),line).to_int()
			match line_nr:
				2: 
					generation_nr = parametr
				4:
					how_many_frame = parametr
				6:
					how_many_agent = parametr
				8:
					how_many_meal = parametr
		line_nr+=1

func get_parametr(line_size:int, text):
	var znak:String = ""
	for i in range(line_size):
		if text[i] == "_":
			break
		znak+=text[i]
	return znak
