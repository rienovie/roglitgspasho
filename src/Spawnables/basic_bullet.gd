extends RigidBody2D
class_name class_bullet

@export var speed: float = 2000.0

func _ready() -> void:
	linear_velocity = Vector2.UP * speed

func _process(_delta: float) -> void:
	if position.y < -100:
		queue_free()