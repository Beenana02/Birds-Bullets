extends Node2D

@export var winnerScreen: PackedScene 

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("Baddies").is_empty():
		get_tree().change_scene_to_file('res://scene/main_menu.tscn')
	else:
		pass
