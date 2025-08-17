extends Node

enum Tool {
	NONE,
	DAISY,
	FREESIA,
	POPPY,
	ROSE,
	VINES,
	FLYTRAP,
	SPRINKLER,
	WATERING_CAN,
	BUG_KILLER
}

var player_currency = 10
var player_label_position = null
var current_tool = Tool.NONE
var in_garden = false
var weapon_lv = 1.0
var watering_lv = 1.0
var watering_upgrade_cost = 100
var weapon_upgrade_cost = 100

var watering_can = null
var weapon = null

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		print("esc pressed")
		current_tool = Tool.NONE
		Input.set_custom_mouse_cursor(null)
