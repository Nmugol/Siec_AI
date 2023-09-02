extends Node

var generation_live:bool = true

class Agent:
	var id:int = 0
	var x_positions = []
	var y_positions = []
	var end_pos:Vector2 = Vector2(0,0)
	var eat:int = 0
	var score:float = 0.0
	pass

class Meal:
	var positions:Vector2 = Vector2(0,0)
	pass
	
var Agent_list = []
var Meal_list = []

func add_agent_to_list(id:int):
	var new_agent = Agent.new()
	new_agent.id = id
	Agent_list.append(new_agent)
	new_agent=null
	pass
	
func add_agent_position(pos_x:float,pos_y:float,id:int):
	Agent_list[id].x_positions.append(pos_x)
	Agent_list[id].y_positions.append(pos_y)
	Agent_list[id].end_pos = Vector2(pos_x,pos_y)
	pass
	
func add_eaten_meals(id:int):
	Agent_list[id].eat += 1
	pass
	
func add_meal_position(pos:Vector2):
	var new_meal = Meal.new()
	new_meal.positions = pos
	Meal_list.append(new_meal)
	new_meal=null
	pass

func calculates_the_score():
	for i in range(DataInput.how_many_agent):
		Agent_list[i].score = Agent_list[i].eat + nearest_meal(Agent_list[i].end_pos.x,Agent_list[i].end_pos.y)
		pass
	pass

func nearest_meal(x:float,y:float):
	if Meal_list.size() == 0:
		return 0.0
	else:
		var distans = []
		for i in range(Meal_list.size()):
			var x_dis = pow((x-Meal_list[i].positions.x),2)
			var y_dis = pow((y-Meal_list[i].positions.y),2)
			distans.append(sqrt(x_dis+y_dis))
			pass
		distans.sort()
		return 1/distans[0]

func save_agent_data():
	var save_game = FileAccess.open("user://entity_position_out.txt",FileAccess.WRITE)
	for i in range(DataInput.how_many_agent):
		var agent = "#ID#var_int_"+str(Agent_list[i].id)
		var ls = Agent_list[i].x_positions.size()
		for j in range(ls):
			var x = "var_float_"+str(Agent_list[i].x_positions[j])
			var y = "var_float_"+str(Agent_list[i].y_positions[j])
			var save_line = agent+"\n"+x+"\n"+y
			save_game.store_line(save_line)
			pass
		pass
	save_game.close()
	
	save_game = FileAccess.open("user://entity_score.txt",FileAccess.WRITE)
	for i in range(DataInput.how_many_agent):
		var agent = "#ID#var_int_"+str(Agent_list[i].id)
		var scor = "var_float_"+str(Agent_list[i].score)
		var save_line = agent+"\n"+scor
		save_game.store_line(save_line)
		pass
		
	generation_live=false
	pass
