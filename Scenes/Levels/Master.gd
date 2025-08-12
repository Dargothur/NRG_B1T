extends Node

const MAIN_MENU = "res://Scenes/Levels/main_menu.tscn"
const GAME_LEVEL = "res://Scenes/Levels/game_level.tscn"

var main_menu = preload(MAIN_MENU).instantiate()
var game_level = preload(GAME_LEVEL).instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.add_child.call_deferred(main_menu)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func returnToMainMenu():
	get_tree().root.remove_child(get_tree().root.get_child(get_tree().root.get_children().size() - 1))
	get_tree().root.add_child(main_menu)
	
	
func loadGameLevel():
	get_tree().root.remove_child(get_tree().root.get_child(get_tree().root.get_children().size() - 1))
	get_tree().root.add_child(game_level)
	
