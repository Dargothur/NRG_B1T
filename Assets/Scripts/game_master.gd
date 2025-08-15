extends Node

enum Tool {
	NONE,
	DAISY,
	FREESIA,
	POPPY,
	ROSE,
	WATERING_CAN,
	BUG_KILLER
}

var player_currency = 10
var player_label_position = null
var current_tool = Tool.NONE
var in_garden = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		print("esc pressed")
		current_tool = Tool.NONE
		Input.set_custom_mouse_cursor(null)
	
				
		
