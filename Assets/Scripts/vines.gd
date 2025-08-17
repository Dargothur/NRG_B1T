extends Area2D

const coin = preload("res://Assets/Scripts/coin.gd")
const grab_anim = preload("res://Assets/SpriteFrames/sprite_frames_tentacle.tres")

var radius = 100.0
var grabTime = 5
var amountGrabbed = 3

@export var tent_grab: PackedScene


func _ready():
	$"vines_ani".play()
	
	$"vine_area".shape.radius = radius
	var timer = $"Timer"
	timer.wait_time = grabTime

func _on_Timer_timeout():
	var objects = get_overlapping_areas()
	var coins = []
	for obj in objects:
		if(obj is coin):
			coins.append(obj)
	for i in range(amountGrabbed):
		if(not coins.is_empty()):
			if (i == 0):
				_play_tent_audio()
			var grabCoin = coins[randi_range(0, coins.size() - 1)]
			_play_tent(grabCoin.global_position)
			grabCoin.set_click(grabCoin.global_position)

func _play_tent(coin_pos):
	var grab = AnimatedSprite2D.new()
	grab.sprite_frames = grab_anim
	add_child(grab)
	grab.top_level = true
	grab.scale *= 2
	grab.global_position = coin_pos
	grab.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	grab.sprite_frames.set_animation_loop(grab.animation, false)
	grab.play("default")
	grab.animation_finished.connect(func():
		grab.queue_free()
	)

func _play_tent_audio() -> void:
	$Tentacle_Audio.volume_db = randf_range(-2.0, 1.0)
	$Tentacle_Audio.pitch_scale = randf_range(1.0, 1.1)
	$Tentacle_Audio.play()
