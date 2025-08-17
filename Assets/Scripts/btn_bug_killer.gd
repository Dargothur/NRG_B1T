extends Button

var bug_killer = load("res://Assets/Images/Fly Swatter/Fly Swatter.png")
var bug_killer_scene = load("res://Assets/Objects/weapon.tscn")

func _on_pressed() -> void:
	if GameMaster.current_tool != GameMaster.Tool.BUG_KILLER:
		GameMaster.current_tool = GameMaster.Tool.BUG_KILLER
		Input.set_custom_mouse_cursor(bug_killer)
		if GameMaster.weapon == null:
			var obj_bug_killer = bug_killer_scene.instantiate()
			add_sibling(obj_bug_killer)
			GameMaster.weapon = obj_bug_killer
		get_viewport().set_input_as_handled()


func _on_mouse_entered() -> void:
	GameMaster.in_garden = false


func _on_mouse_exited() -> void:
	GameMaster.in_garden = true
