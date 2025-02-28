extends Node2D

@onready var particle = $CPUParticles2D
var emitT = false

func _process(delta: float) -> void:
	if emitT == true:
		particle.emitting = true
	else:
		particle.emitting = false
