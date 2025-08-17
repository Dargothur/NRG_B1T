extends Button

var watering_can = load("res://Assets/Images/Watering Can/Watering-Can.png")
var watering_can_scene = load("res://Assets/Objects/watering_can.tscn")

func _on_pressed() -> void:
	if GameMaster.current_tool != GameMaster.Tool.WATERING_CAN:
		GameMaster.current_tool = GameMaster.Tool.WATERING_CAN
		Input.set_custom_mouse_cursor(watering_can)
		if GameMaster.watering_can == null:
			var obj_watering_can = watering_can_scene.instantiate()
			add_sibling(obj_watering_can)
			GameMaster.watering_can = obj_watering_can
		get_viewport().set_input_as_handled()


func _on_mouse_entered() -> void:
	GameMaster.in_garden = false


func _on_mouse_exited() -> void:
	GameMaster.in_garden = true
