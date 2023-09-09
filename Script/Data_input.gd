extends Node2D

var generation_nr:int = 0

var how_many_agent:int = 3
var how_many_meal:int = 8

var widow_size= DisplayServer.window_get_size()
var spritr_radius:int = 32

var speed:float = 100.0 
var next_move:float = 2.0 

var how_many_frame:int = 2

var global_parameters_path:String = "user://global_parameters.txt" 
var entity_parameters_path:String = "user://entity_parameters.txt" 

func _ready():
	# Limited to 1 frame per second
	Engine.max_fps=1
	load_data()

func load_data():
	var global_parameters = FileAccess.open(global_parameters_path,FileAccess.READ)
	var line_nr = 1
		
	while global_parameters.get_position() < global_parameters.get_length():
		var parametr_line = global_parameters.get_line()
		if line_nr%2 == 0:
			var parametr:int = 0
			var linr_sizr = parametr_line.length()
			var znak:String = ""
			for i in range(linr_sizr):
				if parametr_line[i] == "_":
					break
				znak+=parametr_line[i]
			parametr = znak.to_int()
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
