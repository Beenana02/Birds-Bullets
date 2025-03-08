extends Label
var percentShot = Global.percentShot
var ems = Global.ems

func _process(delta: float) -> void:
		self.text = "% Shot: " + str(Global.ems) + "%"
