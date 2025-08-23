extends Control

@export var mainPanel : PanelContainer
@export var mainPanelButton : Button
@export var spawnPlayerButton : Button

func _ready() -> void:
	assert(mainPanel, "mainPanel is not set")
	assert(mainPanelButton, "mainPanelButton is not set")
	assert(spawnPlayerButton, "spawnPlayerButton is not set")

	mainPanel.visible = false
	mainPanelButton.pressed.connect(toggleMainPanel)
	spawnPlayerButton.pressed.connect(spawnPlayer)

	print("UI_DEV ready")

func toggleMainPanel() -> void:
	mainPanel.visible = not mainPanel.visible

func spawnPlayer() -> void:
	if not G.BM:
		G.loadBattleManager()
	G.BM.spawnPlayer()
