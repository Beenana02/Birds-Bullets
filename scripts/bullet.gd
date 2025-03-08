extends Area2D

@export var bSpeed = 800
var particleExplosion = preload("res://Particles/explosion.tscn")

func _physics_process(delta: float) -> void:
	position -= transform.y * bSpeed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	var particleExo = particleExplosion.instantiate()
	get_parent().add_child(particleExo)
	particleExo.position = $CollisionShape2D.global_position
	particleExo.emitT = true
	queue_free()


func _on_auto_delete_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var particleExo = particleExplosion.instantiate()
		get_parent().add_child(particleExo)
		particleExo.position = $CollisionShape2D.global_position
		particleExo.emitT = true
		queue_free()
