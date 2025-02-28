extends Label

func _process(delta: float) -> void:
	if Global.lives >=1:
		self.text = "Lives Left: " + str(Global.lives)
	else:
		self.text = 'DEAD'
