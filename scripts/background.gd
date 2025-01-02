class_name Background
extends Sprite2D

func _ready() -> void:
	centered = false
	
	# Test card spawning
	var card = TarotCard.new(TarotCard.Suit.MAJOR, 21)
	card.position = Vector2(100, 100)
	get_parent().add_child.call_deferred(card)
	
func _process(_delta: float) -> void:
	position = Vector2.ZERO
	scale = get_viewport().get_visible_rect().size / texture.get_size()
