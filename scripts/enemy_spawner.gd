extends Marker2D

@export var enemies: PackedScene
@export var spawnRange: int
@export var spawnRate: int
var location = global_position
func _ready() -> void:
	$Timer.wait_time = spawnRate
	
func spawn(SR, mob):
	var can_shoot = randi_range(1,2)
	SR = spawnRange
	mob = enemies.instantiate()
	if can_shoot %2 == 0:
		mob.shooting = false
	else:
		mob.shooting = true
	location.x = randf_range(0,SR)
	location.y = 0
	mob.global_position = location
	add_child(mob)


func _on_timer_timeout() -> void:
	spawn(spawnRange,enemies)
	print('spawn'+ str(location.x))
