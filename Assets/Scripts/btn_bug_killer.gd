extends Button

var bug_killer = load("res://Assets/Images/Fly Swatter/Fly Swatter.png")
var bug_killer_scene = load("res://Assets/Objects/weapon.tscn")

func _on_pressed() -> void:
	GameMaster.current_tool = GameMaster.Tool.BUG_KILLER
	Input.set_custom_mouse_cursor(bug_killer)
	var obj_bug_killer = bug_killer_scene.instantiate()
	add_sibling(obj_bug_killer)
	
