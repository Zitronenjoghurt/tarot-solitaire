extends Node

signal pile_changed(pile_id: String)

@export var state: CardState = CardState.new()
var _pile_nodes: Dictionary = {}

func register_pile_resource(pile_id: String, pile_resource: PileResource = null) -> void:
	if pile_resource == null:
		pile_resource = PileResource.new()
	state.piles[pile_id] = pile_resource

func register_pile_node(pile_id: String, pile_node: CardPile) -> void:
	_pile_nodes[pile_id] = pile_node
	pile_node.pile_id = pile_id

func get_pile_cards(pile_id: String) -> Array[CardResource]:
	return state.piles.get(pile_id, PileResource.new()).cards
