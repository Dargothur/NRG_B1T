extends Area2D

const flower = preload("res://Assets/Scripts/flower.gd")

var lvl = GameMaster.watering_lv
var sprinkles = 10
var lifeTime = .33

func _ready():
	$"Sprinkle Effect".amount = sprinkles * lvl
	$"Sprinkle Effect".lifetime = lifeTime * lvl
	scale = Vector2(lvl,lvl)

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if(Input.is_action_just_pressed("use_tool") and GameMaster.current_tool == GameMaster.Tool.WATERING_CAN):
			$AudioStreamPlayer2D.play()
			var length = $AudioStreamPlayer2D.stream.get_length()
			$AudioStreamPlayer2D.seek(randf() * length)
	if(Input.is_action_pressed("use_tool") and GameMaster.current_tool == GameMaster.Tool.WATERING_CAN):
		var objects = get_overlapping_areas()
		for obj in objects:
			if(obj is flower):
				obj.water(delta * 30 * lvl)
		$"Sprinkle Effect".emitting = true
	if(Input.is_action_just_released("use_tool")):
		$"Sprinkle Effect".emitting = false
		$AudioStreamPlayer2D.stop()
	if(Input.is_action_just_pressed("ui_cancel")):
		queue_free()
