extends Button

@export
var toolType : GameMaster.Tool = GameMaster.Tool.DAISY

func _on_mouse_entered() -> void:
	global_position -= Vector2(0,10)


func _on_mouse_exited() -> void:
	global_position += Vector2(0,10)


func _on_pressed() -> void:
	GameMaster.current_tool = toolType
