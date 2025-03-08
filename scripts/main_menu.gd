extends Control
var level1 = preload("res://scene/level1.tscn")

func _ready() -> void:
	$VBoxContainer/Start.grab_focus()
func _process(delta: float) -> void:
	var hiScore = 0
	hiScore = Global.bestScore
	$ColorRect/Highscore.text = "Best Score: " + str(hiScore)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/level1.tscn")
	


func _on_intro_pressed() -> void:
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	pass # Replace with function body.


#Quit Button
func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_quit_focus_entered() -> void:
	$Quit.text = 'Come Back Soon?'

func _on_quit_focus_exited() -> void:
	$Quit.text = 'Quit Game'


func _on_endless_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/endless_mode.tscn")
