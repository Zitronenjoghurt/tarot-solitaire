class_name Background
extends Sprite2D

func _ready() -> void:
	centered = false
	
func _process(_delta: float) -> void:
	position = Vector2.ZERO
	scale = get_viewport().get_visible_rect().size / texture.get_size()
