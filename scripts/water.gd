@tool
extends Sprite2D

func _ready() -> void:
	zoomChanged()

func _process(delta: float) -> void:
	zoomChanged()
	
func zoomChanged():
	material.set_shader_parameter("y_zoom", get_viewport_transform().get_scale().y)
