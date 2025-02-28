extends ParallaxLayer

@export var speed = 100

func _process(delta: float) -> void:
	self.motion_offset.y += speed *delta
