extends Node

var player = load("res://scenes/player.tscn")
var bullet = load("res://scenes/basic_bullet.tscn")
var rootNode : Node2D

func _ready() -> void:
	rootNode = get_tree().root.get_node("Root")
	var newPlayer = player.instantiate()
	add_child(newPlayer)
