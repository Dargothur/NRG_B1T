extends Button

var watering_can = load("res://Assets/Images/Watering Can/Watering-Can.png")
var watering_can_scene = load("res://Assets/Objects/watering_can.tscn")

func _on_pressed() -> void:
	GameMaster.current_tool = GameMaster.Tool.WATERING_CAN
	Input.set_custom_mouse_cursor(watering_can)
	var obj_watering_can = watering_can_scene.instantiate()
	add_sibling(obj_watering_can)
