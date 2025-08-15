extends Button

var bug_killer = load("res://Assets/Images/Fly Swatter/Fly Swatter.png")

func _on_pressed() -> void:
	GameMaster.current_tool = GameMaster.Tool.BUG_KILLER
	Input.set_custom_mouse_cursor(bug_killer)
	
