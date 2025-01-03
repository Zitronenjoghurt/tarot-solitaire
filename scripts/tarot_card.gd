class_name TarotCard
extends Area2D

enum Suit {
	MAJOR,
	WANDS,
	CUPS,
	SWORDS,
	PENTACLES
}

signal clicked(card: TarotCard)

var sprite: AnimatedSprite2D
var collision_shape: CollisionShape2D
var suit: Suit
var value: int
var is_hovered: bool = false

var face_up: bool = true:
	set(value):
		if face_up != value:
			face_up = value
			_update_facing()

func _ready() -> void:
	mouse_entered.connect(_on_mouse_enter)
	mouse_exited.connect(_on_mouse_exit)
	input_event.connect(_on_input_event)

func _init(card_resource: CardResource = null) -> void:
	if card_resource == null:
		card_resource = CardResource.new()
	
	suit = card_resource.suit
	value = card_resource.value
	face_up = card_resource.face_up
	
	var texture = CardData.get_texture(suit, value) as Texture2D
	sprite = _setup_sprite(texture)
	add_child(sprite)
	
	var texture_size = texture.get_size()
	collision_shape = _setup_collision_shape(texture_size)
	add_child(collision_shape)

func _setup_sprite(texture: Texture) -> AnimatedSprite2D:
	var frames = SpriteFrames.new()
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
	
	var card_sprite = AnimatedSprite2D.new()
	card_sprite.sprite_frames = frames
	
	return card_sprite

func _setup_collision_shape(texture_size: Vector2) -> CollisionShape2D:
	var shape = RectangleShape2D.new()
	shape.size = texture_size
	
	var card_collision_shape = CollisionShape2D.new()
	card_collision_shape.shape = shape
	card_collision_shape.scale = Vector2(0.9, 0.9)
	
	return card_collision_shape

func _update_facing() -> void:
	if face_up:
		turn_up()
	else:
		turn_down()

# Events
func _on_mouse_enter() -> void:
	scale = Vector2(1.05, 1.05)
	is_hovered = true

func _on_mouse_exit() -> void:
	scale = Vector2(1.0, 1.0)
	is_hovered = false

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_on_left_mouse_click()

func _on_left_mouse_click() -> void:
	emit_signal("clicked", self)

# Animations
func turn_up() -> void:
	if face_up:
		return
	
	face_up = true
	sprite.play("spin")
	sprite.animation_finished.connect(_on_spin_up_finished, CONNECT_ONE_SHOT)

func _on_spin_up_finished() -> void:
	sprite.play("flash")
	sprite.animation_finished.connect(_on_flash_up_finished, CONNECT_ONE_SHOT)

func _on_flash_up_finished() -> void:
	sprite.play("default")

func turn_down() -> void:
	if not face_up:
		return
	
	face_up = false
	sprite.play_backwards("flash")
	sprite.animation_finished.connect(_on_flash_down_finished, CONNECT_ONE_SHOT)

func _on_flash_down_finished() -> void:
	sprite.play_backwards("spin")
	sprite.animation_finished.connect(_on_spin_down_finished, CONNECT_ONE_SHOT)

func _on_spin_down_finished() -> void:
	sprite.play("face_down")
