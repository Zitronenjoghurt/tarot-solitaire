extends Node

const TEXTURES = {
	"major": {
		0: preload("res://assets/major_arcana/tarot__fool.png"),
		1: preload("res://assets/major_arcana/tarot__magician.png"),
		2: preload("res://assets/major_arcana/tarot__priestess.png"),
		3: preload("res://assets/major_arcana/tarot__empress.png"),
		4: preload("res://assets/major_arcana/tarot__emperor.png"),
		5: preload("res://assets/major_arcana/tarot__hierophant.png"),
		6: preload("res://assets/major_arcana/tarot__lovers.png"),
		7: preload("res://assets/major_arcana/tarot__chariot.png"),
		8: preload("res://assets/major_arcana/tarot__strength.png"),
		9: preload("res://assets/major_arcana/tarot__hermit.png"),
		10: preload("res://assets/major_arcana/tarot__fortune.png"),
		11: preload("res://assets/major_arcana/tarot__justice.png"),
		12: preload("res://assets/major_arcana/tarot__hangman.png"),
		13: preload("res://assets/major_arcana/tarot__death.png"),
		14: preload("res://assets/major_arcana/tarot__temperance.png"),
		15: preload("res://assets/major_arcana/tarot__devil.png"),
		16: preload("res://assets/major_arcana/tarot__tower.png"),
		17: preload("res://assets/major_arcana/tarot__star.png"),
		18: preload("res://assets/major_arcana/tarot__moon.png"),
		19: preload("res://assets/major_arcana/tarot__sun.png"),
		20: preload("res://assets/major_arcana/tarot__judgment.png"),
		21: preload("res://assets/major_arcana/tarot__theworld.png")
	},
	"wands": {
		0: preload("res://assets/minor_arcana/tarot__ace_wands.png"),
		1: preload("res://assets/minor_arcana/tarot__2_wands.png"),
		2: preload("res://assets/minor_arcana/tarot__3_wands.png"),
		3: preload("res://assets/minor_arcana/tarot__4_wands.png"),
		4: preload("res://assets/minor_arcana/tarot__5_wands.png"),
		5: preload("res://assets/minor_arcana/tarot__6_wands.png"),
		6: preload("res://assets/minor_arcana/tarot__7_wands.png"),
		7: preload("res://assets/minor_arcana/tarot__8_wands.png"),
		8: preload("res://assets/minor_arcana/tarot__9_wands.png"),
		9: preload("res://assets/minor_arcana/tarot__10_wands.png"),
		10: preload("res://assets/minor_arcana/tarot__page_wands.png"),
		11: preload("res://assets/minor_arcana/tarot__knight_wands.png"),
		12: preload("res://assets/minor_arcana/tarot__queen_wands.png"),
		13: preload("res://assets/minor_arcana/tarot__king_wands.png")
	},
	"cups": {
		0: preload("res://assets/minor_arcana/tarot__ace_cups.png"),
		1: preload("res://assets/minor_arcana/tarot__2_cups.png"),
		2: preload("res://assets/minor_arcana/tarot__3_cups.png"),
		3: preload("res://assets/minor_arcana/tarot__4_cups.png"),
		4: preload("res://assets/minor_arcana/tarot__5_cups.png"),
		5: preload("res://assets/minor_arcana/tarot__6_cups.png"),
		6: preload("res://assets/minor_arcana/tarot__7_cups.png"),
		7: preload("res://assets/minor_arcana/tarot__8_cups.png"),
		8: preload("res://assets/minor_arcana/tarot__9_cups.png"),
		9: preload("res://assets/minor_arcana/tarot__10_cups.png"),
		10: preload("res://assets/minor_arcana/tarot__page_cups.png"),
		11: preload("res://assets/minor_arcana/tarot__knight_cups.png"),
		12: preload("res://assets/minor_arcana/tarot__queen_cups.png"),
		13: preload("res://assets/minor_arcana/tarot__king_cups.png")
	},
	"swords": {
		0: preload("res://assets/minor_arcana/tarot__ace_swords.png"),
		1: preload("res://assets/minor_arcana/tarot__2_swords.png"),
		2: preload("res://assets/minor_arcana/tarot__3_swords.png"),
		3: preload("res://assets/minor_arcana/tarot__4_swords.png"),
		4: preload("res://assets/minor_arcana/tarot__5_swords.png"),
		5: preload("res://assets/minor_arcana/tarot__6_swords.png"),
		6: preload("res://assets/minor_arcana/tarot__7_swords.png"),
		7: preload("res://assets/minor_arcana/tarot__8_swords.png"),
		8: preload("res://assets/minor_arcana/tarot__9_swords.png"),
		9: preload("res://assets/minor_arcana/tarot__10_swords.png"),
		10: preload("res://assets/minor_arcana/tarot__page_swords.png"),
		11: preload("res://assets/minor_arcana/tarot__knight_swords.png"),
		12: preload("res://assets/minor_arcana/tarot__queen_swords.png"),
		13: preload("res://assets/minor_arcana/tarot__king_swords.png")
	},
	"pentacles": {
		0: preload("res://assets/minor_arcana/tarot__ace_pentacles.png"),
		1: preload("res://assets/minor_arcana/tarot__2_pentacles.png"),
		2: preload("res://assets/minor_arcana/tarot__3_pentacles.png"),
		3: preload("res://assets/minor_arcana/tarot__4_pentacles.png"),
		4: preload("res://assets/minor_arcana/tarot__5_pentacles.png"),
		5: preload("res://assets/minor_arcana/tarot__6_pentacles.png"),
		6: preload("res://assets/minor_arcana/tarot__7_pentacles.png"),
		7: preload("res://assets/minor_arcana/tarot__8_pentacles.png"),
		8: preload("res://assets/minor_arcana/tarot__9_pentacles.png"),
		9: preload("res://assets/minor_arcana/tarot__10_pentacles.png"),
		10: preload("res://assets/minor_arcana/tarot__page_pentacles.png"),
		11: preload("res://assets/minor_arcana/tarot__knight_pentacles.png"),
		12: preload("res://assets/minor_arcana/tarot__queen_pentacles.png"),
		13: preload("res://assets/minor_arcana/tarot__king_pentacles.png")
	}
}

const TEXTURE_FACE_DOWN = preload("res://assets/tarot__back.png")

const TEXTURES_SPIN = [
	preload("res://assets/animations/tarot__spin_1.png"),
	preload("res://assets/animations/tarot__spin_2.png"),
	preload("res://assets/animations/tarot__spin_3.png"),
	preload("res://assets/animations/tarot__spin_4.png"),
	preload("res://assets/animations/tarot__spin_5.png"),
	preload("res://assets/animations/tarot__spin_6.png"),
	preload("res://assets/animations/tarot__spin_7.png"),
	preload("res://assets/animations/tarot__spin_8.png"),
	preload("res://assets/animations/tarot__spin_9.png"),
	preload("res://assets/animations/tarot__spin_10.png"),
	preload("res://assets/animations/tarot__spin_11.png")
]

const TEXTURES_FLASH = [
	preload("res://assets/animations/tarot__flash_1.png"),
	preload("res://assets/animations/tarot__flash_2.png"),
	preload("res://assets/animations/tarot__flash_3.png"),
	preload("res://assets/animations/tarot__flash_4.png")
]

func get_suit_name(suit: TarotCard.Suit) -> String:
	match suit:
		TarotCard.Suit.MAJOR:
			return "major"
		TarotCard.Suit.WANDS:
			return "wands"
		TarotCard.Suit.CUPS:
			return "cups"
		TarotCard.Suit.SWORDS:
			return "swords"
		TarotCard.Suit.PENTACLES:
			return "pentacles"
	return ""

func get_texture(suit: TarotCard.Suit, value: int) -> Texture2D:
	var suit_name = get_suit_name(suit)
	if not TEXTURES.has(suit_name):
		push_error("Unable to fetch tarot card texture: invalid tarot suit")
		return null
	
	if not TEXTURES[suit_name].has(value):
		push_error("Unable to fetch tarot card texture: invalid value for suit " + suit_name)
		return null
	
	return TEXTURES[suit_name][value]
