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
		_play_coin_grab()
		clicked = true
		get_viewport().set_input_as_handled()

func _on_audio_stream_player_2d_finished() -> void:
	self.queue_free()

func _physics_process(delta: float) -> void:
	if(clicked):
		speed = 600.0
		$CollisionShape2D.disabled = true
		if(global_position == GameMaster.player_label_position): 
			trigger_sound = true
		global_position = global_position.move_toward(GameMaster.player_label_position, speed * delta)
	else:
		global_position = global_position.move_toward(drop_spot, speed * delta)
		
	if(trigger_sound):
		clicked = false
		GameMaster.player_currency += coin_value
		_play_coin_banked()
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

func _play_coin_grab() -> void:
	$Coin_Grab.volume_db = randf_range(-2.0, 1.0)
	$Coin_Grab.pitch_scale = randf_range(3.0, 4.0)
	$Coin_Grab.play()

func _play_coin_banked() -> void:
	$Coin_Recieved.volume_db = randf_range(-20.0, -15.0)
	$Coin_Recieved.pitch_scale = randf_range(1.0, 1.1)
	$Coin_Recieved.play()
