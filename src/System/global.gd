extends Node

var rootNode : Node2D
var BM : class_BattleManager
var DEV_MODE : bool = true

func _ready() -> void:
	rootNode = get_tree().root.get_node("Root")
	if DEV_MODE:
		loadDEVMenu()

func loadBattleManager() -> void:
	if BM:
		BM.queue_free()
	BM = load("res://src/System/battle_Manager.gd").new()
	# NOTE: must be added to rootNode because spawnables are under BM and need node2d
	rootNode.add_child(BM)

func loadDEVMenu() -> void:
	var DEVMenu = load("res://scenes/UI/UI_DEV.tscn").instantiate()
	# NOTE: cannot be added to rootNode because it's ui
	add_child(DEVMenu)