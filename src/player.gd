extends CharacterBody2D
class_name class_Player

@export var speed: float = 50000.0
@export var speedMultiplier: float = 1.0
var direction = Vector2.ZERO


var maxScreenX: int = 32
var maxScreenY: int = 32

var shooting: bool = false
var fireRate: float = 0.5
var timeSinceLastShot: float = 0.0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_up"):
		if direction.y > -1:
			direction.y -= 1
	if event.is_action_pressed("move_down"):
		if direction.y < 1:
			direction.y += 1
	if event.is_action_pressed("move_left"):
		if direction.x > -1:
			direction.x -= 1
	if event.is_action_pressed("move_right"):
		if direction.x < 1:
			direction.x += 1
	if event.is_action_released("move_up"):
		if direction.y < 1:
			direction.y += 1
	if event.is_action_released("move_down"):
		if direction.y > -1:
			direction.y -= 1
	if event.is_action_released("move_left"):
		if direction.x < 1:
			direction.x += 1
	if event.is_action_released("move_right"):
		if direction.x > -1:
			direction.x -= 1
	if event.is_action_pressed("shoot"):
		shooting = true
	if event.is_action_released("shoot"):
		shooting = false

func shoot() -> void:
	var newBullet = G.bullet.instantiate()
	newBullet.position = position + Vector2(0,-100)
	G.rootNode.add_child(newBullet)

func _physics_process(_delta: float) -> void:
	velocity = (direction * speed * _delta)
	move_and_slide()
	position.x = clamp(position.x, maxScreenX, get_viewport_rect().size.x - maxScreenX)
	position.y = clamp(position.y, maxScreenY, get_viewport_rect().size.y - maxScreenY)

	if shooting and timeSinceLastShot >= fireRate:
		shoot()
		timeSinceLastShot = 0.0
	if timeSinceLastShot < fireRate:
		timeSinceLastShot += _delta

func _ready() -> void:
	var spriteSize = get_node("Sprite2D").texture.get_size()
	spriteSize = spriteSize * self.transform.get_scale()
	maxScreenX = spriteSize.x / 2
	maxScreenY = spriteSize.y / 2
	print(maxScreenX, maxScreenY)
