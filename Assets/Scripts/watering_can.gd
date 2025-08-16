extends Area2D

const flower = preload("res://Assets/Scripts/flower.gd")

var lvl = 1

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if(Input.is_action_pressed("use_tool") and GameMaster.current_tool == GameMaster.Tool.WATERING_CAN):
		var objects = get_overlapping_areas()
		for obj in objects:
			if(obj is flower):
				obj.water(delta * 30 * lvl)
