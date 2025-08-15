extends Area2D

var starting_position
var t = 0.0
var clicked = false
var trigger_sound = false
var speed = 200
var drop_spot = Vector2(0,0)
var coin_value = 1

var one_cent = load("res://Assets/SpriteFrames/sprite_frames_1-cent.tres")
var three_cent = load("res://Assets/SpriteFrames/sprite_frames_3-cent.tres")
var five_cent = load("res://Assets/SpriteFrames/sprite_frames_5-cent.tres")
var ten_cent = load("res://Assets/SpriteFrames/sprite_frames_10-cent.tres")

func _ready():
	pass
		
func setup(new_coin_value):
	coin_value = new_coin_value
	match coin_value:
		1:
			$"Coin Animation".sprite_frames = one_cent
		3:
			$"Coin Animation".sprite_frames = three_cent
		5:
			$"Coin Animation".sprite_frames = five_cent
		10:
			$"Coin Animation".sprite_frames = ten_cent
	$"Coin Animation".play()

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_released() and !clicked:
		starting_position = $".".global_position
		$Small_Sparkle.emitting = true
		clicked = true
		get_viewport().set_input_as_handled()

func _on_audio_stream_player_2d_finished() -> void:
	self.queue_free()

func _physics_process(delta: float) -> void:
	if(clicked):
		if(t < 1.0): 
			t += delta * 0.4
		else:
			trigger_sound = true
		$".".global_position = starting_position.lerp(GameMaster.player_label_position, t)
	else:
		global_position = global_position.move_toward(drop_spot, speed * delta)
		
	if(trigger_sound):
		clicked = false
		GameMaster.player_currency += coin_value
		$AudioStreamPlayer2D.play()
		$Flower_Sparkle.amount = coin_value * 3
		$Flower_Sparkle.emitting = true
		$Small_Sparkle.emitting = true
		$"Coin Animation".visible = false
		$CollisionShape2D.disabled = true
		trigger_sound = false
	
func set_drop_spot(drop_spot_target):
	drop_spot = drop_spot_target
	
func set_click(click_pos):
	$Small_Sparkle.emitting = true
	starting_position = click_pos
	clicked = true
