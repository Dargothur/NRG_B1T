extends Node

const MAIN_MENU = "res://Scenes/Levels/main_menu.tscn"
const GAME_LEVEL = "res://Scenes/Levels/game_level.tscn"

var main_menu = preload(MAIN_MENU).instantiate()
var game_level = preload(GAME_LEVEL).instantiate()

func returnToMainMenu():
	get_tree().root.remove_child(get_tree().root.get_child(get_tree().root.get_children().size() - 1))
	game_level = preload(GAME_LEVEL).instantiate()
	get_tree().root.add_child(main_menu)
	GameMaster.reset()
	
func loadGameLevel():
	get_tree().root.remove_child(get_tree().root.get_child(get_tree().root.get_children().size() - 1))
	get_tree().root.add_child(game_level)
	
