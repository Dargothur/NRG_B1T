extends Area2D



func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if(Input.is_action_pressed("use_tool")):
		print("Watering...")
