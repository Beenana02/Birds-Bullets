extends Node2D

var score = 0
var lives = 3
var bestScore = 0

func _process(delta: float) -> void:
	if lives == 0:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://scene/main_menu.tscn")
		lives = 3
		score = 0
	if score >= bestScore:
		bestScore = score
	
