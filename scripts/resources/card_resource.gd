class_name CardResource
extends Resource

@export var face_up: bool = true
@export var suit: TarotCard.Suit = TarotCard.Suit.MAJOR
@export var value: int = 0

static func create_random() -> CardResource:
	var random_suit_index = randi_range(0, 4)
	
	var random_value = 0
	var random_suit = TarotCard.Suit.MAJOR
	match random_suit_index:
		0:
			random_value = randi_range(0, 21)
		1:
			random_suit = TarotCard.Suit.WANDS
			random_value = randi_range(0, 13)
		2:
			random_suit = TarotCard.Suit.CUPS
			random_value = randi_range(0, 13)
		3:
			random_suit = TarotCard.Suit.SWORDS
			random_value = randi_range(0, 13)
		4:
			random_suit = TarotCard.Suit.PENTACLES
			random_value = randi_range(0, 13)
	
	var random_resource = CardResource.new()
	random_resource.suit = random_suit
	random_resource.value = random_value
	return random_resource
