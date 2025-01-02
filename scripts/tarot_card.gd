class_name TarotCard
extends AnimatedSprite2D

enum Suit {
	MAJOR,
	WANDS,
	CUPS,
	SWORDS,
	PENTACLES
}

var suit: Suit
var value: int
var face_up: bool = true

func _init(card_suit: Suit, card_value: int) -> void:
	suit = card_suit
	value = card_value
	
	var frames = SpriteFrames.new()
	
	var texture = CardData.get_texture(suit, value)
	frames.add_frame("default", texture)
	
	frames.add_animation("face_down")
	frames.add_frame("face_down", CardData.TEXTURE_FACE_DOWN)
	
	frames.add_animation("spin")
	frames.set_animation_loop("spin", false)
	frames.set_animation_speed("spin", 40.0)
	for spin_texture in CardData.TEXTURES_SPIN:
		frames.add_frame("spin", spin_texture)
	
	frames.add_animation("flash")
	frames.set_animation_loop("flash", false)
	frames.set_animation_speed("flash", 60.0)
	for flash_texture in CardData.TEXTURES_FLASH:
		frames.add_frame("flash", flash_texture)
	frames.add_frame("flash", texture)
	
	sprite_frames = frames

func turn_up() -> void:
	if face_up:
		return
	
	face_up = true
	play("spin")
	animation_finished.connect(_on_spin_up_finished, CONNECT_ONE_SHOT)

func _on_spin_up_finished() -> void:
	play("flash")
	animation_finished.connect(_on_flash_up_finished, CONNECT_ONE_SHOT)

func _on_flash_up_finished() -> void:
	play("default")

func turn_down() -> void:
	if not face_up:
		return
	
	face_up = false
	play_backwards("flash")
	animation_finished.connect(_on_flash_down_finished, CONNECT_ONE_SHOT)

func _on_flash_down_finished() -> void:
	play_backwards("spin")
	animation_finished.connect(_on_spin_down_finished, CONNECT_ONE_SHOT)

func _on_spin_down_finished() -> void:
	play("face_down")
