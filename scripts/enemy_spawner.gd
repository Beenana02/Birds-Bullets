extends Marker2D

@export var enemies: PackedScene
@export var spawnRange: int
var location = global_position
func spawn(SR, mob):
	SR = spawnRange
	mob = enemies.instantiate()
	location.x = randf_range(0,SR)
	location.y = 0
	mob.global_position = location
	add_child(mob)


func _on_timer_timeout() -> void:
	spawn(spawnRange,enemies)
	print('spawn'+ str(location.x))
