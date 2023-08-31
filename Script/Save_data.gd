extends Node

class Agent:
	var id:int = 0
	var x_positions = []
	var y_positions = []
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
