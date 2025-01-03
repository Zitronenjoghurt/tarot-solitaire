class_name CardPile
extends TextureRect

enum PileLayout {
	STACK,
	CASCADE
}

signal card_clicked(card: TarotCard, pile: CardPile)

@export var pile_id: String = ""
@export var layout: PileLayout = PileLayout.STACK

var card_nodes: Array[TarotCard] = []

func _ready() -> void:
	var card_node = TarotCard.new()
	add_child(card_node)
	card_node.clicked.connect(_on_card_clicked)
	card_nodes.append(card_node)

func _refresh_from_state() -> void:
	for card in card_nodes:
		card.queue_free()
	card_nodes.clear()
	
	var pile_cards = CardManager.get_pile_cards(pile_id)
	if pile_cards.is_empty():
		return
	
	for card_data in pile_cards:
		var card_node = TarotCard.new(card_data)
		add_child(card_node)
		card_node.clicked.connect(_on_card_clicked)
		card_nodes.append(card_node)

# Events
func _on_pile_changed(changed_pile_id: String) -> void:
	if changed_pile_id == pile_id:
		_refresh_from_state()

func _on_card_clicked(card: TarotCard) -> void:
	emit_signal("card_clicked", card, self)
