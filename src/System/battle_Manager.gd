extends Node
class_name class_BattleManager

var player = load("res://scenes/player.tscn")
var bullet = load("res://scenes/basic_bullet.tscn")

func spawnPlayer() -> void:
	var newPlayer = player.instantiate()
	var viewport = get_viewport()
	newPlayer.position = Vector2(viewport.size.x * 0.5, viewport.size.y * 0.9)
	add_child(newPlayer)