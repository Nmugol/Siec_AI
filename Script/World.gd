extends Node2D

func _process(delata):
	if !SaveData.generation_live:
		get_tree().quit()
