extends Node2D

var how_many_agent:int = 3
var how_many_meal:int = 8

var widow_size= DisplayServer.window_get_size()
var spritr_radius:int = 32

var speed = 100 
var max_move_time = 2.0 # 2 s

var time_out = 2

func _ready():
	# Limited to 1 frame per second
	Engine.max_fps=1