extends Node2D

var speedupFactor = 1

#find out how many shot down
var percentShot = Global.percentShot


func _ready() -> void:
	Global.lives = 6
	
func _process(delta: float) -> void:
	#$ColorRect/Highscore.text = 'Best Score: '+str(Global.bestScore)
	pass

func _on_speed_up_timeout() -> void:
	$enemySpawner.spawnRate -= speedupFactor
	$enemySpawner.spawnRate -= speedupFactor
	print(str($enemySpawner.spawnRate))

func _on_enemy_spawner_2_child_entered_tree(node: Node) -> void:
	if node.is_in_group('Baddies'):
			Global.ems +=1
func _on_enemy_spawner_child_entered_tree(node: Node) -> void:
	if node.is_in_group('Baddies'):
			Global.ems +=1
func _on_enemy_spawner_child_exiting_tree(node: Node) -> void:
	if node.is_in_group('Baddies'):
			Global.ems -=1
func _on_enemy_spawner_2_child_exiting_tree(node: Node) -> void:
	if node.is_in_group('Baddies'):
			Global.ems -=1
