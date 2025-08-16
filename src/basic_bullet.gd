extends RigidBody2D
class_name class_bullet

@export var speed: float = 2000.0

func _ready() -> void:
	linear_velocity = Vector2.UP * speed
