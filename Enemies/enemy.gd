extends CharacterBody2D

@export var speed = 200
@export var itself: PackedScene
var enteredScreen = false
var leftScreen = false

var bullet = preload("res://scene/bullet.tscn")
@export var shooting = false

#health bar
@export var health = 2

func _process(delta: float) -> void:
	if health <= 0:
		queue_free()
		print('dead')

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	move_and_slide()

# detect when to delete enemy if left screen
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	if enteredScreen == false:
		enteredScreen =true
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if enteredScreen == true and leftScreen == false:
		queue_free()
		print('deleted')
	else:
		pass

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		health -=1
		if health == 0:
			Global.score += 1	
	elif area.is_in_group('Player'):
		$CollisionShape2D.disabled = true
		$Hitbox/CollisionShape2D.disabled = true


func _on_hitbox_area_exited(area: Area2D) -> void:
	if area.is_in_group('Player'):
		$CollisionShape2D.disabled = false
		$Hitbox/CollisionShape2D.disabled = false


#shooting enemy (set shooting to true)
func shoot():
	if shooting == true:
		var bul = bullet.instantiate()
		bul.rotation_degrees += 90
		get_parent().add_child(bul)
		bul.position = $GunMuzzle.global_position
	

func _on_delay_shoot_timeout() -> void:
	shoot()
	$DelayShoot.wait_time = randf_range(0.5,3)

func _on_delay_shoot_ready() -> void:
	$DelayShoot.wait_time = randf_range(0.5,3)
