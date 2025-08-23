extends Node2D
class_name class_EnemyBase

@export var health : int = 100
@export var speed : float = 100.0
# Used to group enemies together for xp and loot bonuses
@export var groupID : int = 0
@export var experience : int = 1

func _ready() -> void:
    pass

func take_damage(damage : int) -> void:
    health -= damage
    if health <= 0:
        queue_free()
        # TODO: add groupID countdown
