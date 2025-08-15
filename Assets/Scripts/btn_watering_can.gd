extends Button

var watering_can = load("res://Assets/Images/Watering Can/Watering-Can.png")

func _on_pressed() -> void:
	GameMaster.current_tool = GameMaster.Tool.WATERING_CAN
	Input.set_custom_mouse_cursor(watering_can)
