extends Node2D

var speedupFactor = 1

func _ready() -> void:
	Global.lives = 6
	


func _on_speed_up_timeout() -> void:
	$enemySpawner.spawnRate -= speedupFactor
	$enemySpawner.spawnRate -= speedupFactor
	print(str($enemySpawner.spawnRate))
