extends CharacterBody2D

@export var speed = 400
@export var acceleration = 2
@export var friction = 0.2
var bullet = preload("res://scene/bullet.tscn")
@onready var aniplayer = $AnimatedSprite2D
@onready var shadowaniplayer = $BirdShadow

var dodging = false
var canShoot = true
var notTurning = true

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("back") - Input.get_action_strength("forward")
	return input.normalized()
	
func shoot():
	var bul = bullet.instantiate()
	bul.rotation_degrees -= 90
	get_parent().add_child(bul)
	bul.position = $muzzle.global_position
	canShoot = false
	$CanShoot.start()
		
func animations():
	if Input.is_action_pressed("left"):
		aniplayer.play('left')
		shadowaniplayer.play('left')
		notTurning = false
	elif Input.is_action_pressed('right'):
		aniplayer.play("right")
		shadowaniplayer.play('right')
		notTurning = false
	elif Input.is_action_just_pressed("forward"):
		aniplayer.play("straight")
		shadowaniplayer.play('straight')
	elif Input.is_action_just_released("left"):
		aniplayer.play("straight")
		shadowaniplayer.play('straight')
	elif Input.is_action_just_released("right"):
		aniplayer.play("straight")
		shadowaniplayer.play('straight')
			
func _process(delta: float) -> void:
	animations()
	playerMovement(delta)
	
	if Global.lives == 0:
		queue_free()
	
	if Input.is_action_just_pressed("shoot") and dodging == false and canShoot == true:
		shoot()
		
	
	
	if Input.is_action_just_pressed("dodge"):
		dodge()
func playerMovement(delta):
	var playerInput = get_input()
	var direction := Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if input != Vector2.ZERO:
		velocity = lerp(velocity, playerInput * speed, delta * acceleration)
	else:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	move_and_slide()
	
#dodge mechanics 
func _on_timer_timeout() -> void:
	if dodging:
		dodging = false
		$AnimatedSprite2D.modulate = Color(1,1,1,1)
		$CollisionShape2D.disabled = false
		$Area2D/CollisionShape2D.disabled = false
func dodge():
	dodging = true
	$AnimatedSprite2D.modulate = Color(0,0,0,1)
	$CollisionShape2D.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	$DodgeTimer.start()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Baddies") and dodging == false:
		if Global.lives >= 1:
			Global.lives -= 1
	elif area.is_in_group('bullet')and dodging == false:
		if Global.lives >= 1:
			Global.lives -= 1


func _on_can_shoot_timeout() -> void:
	canShoot = true


func _on_flap_timeout() -> void:
	aniplayer.play("flap")
	shadowaniplayer.play("flap")
