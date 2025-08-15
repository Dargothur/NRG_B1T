extends Area2D

class_name Flower

enum GrowthStage {
	SPROUT = 0,
	FLOWER
}

enum FlowerType {
	DAISY,
	FREESIA,
	POPPY,
	ROSE
}

var currentStage = GrowthStage.SPROUT
var flowerType = FlowerType.DAISY

@export var coin_scene = load("res://Assets/Objects/coin.tscn")

var daisy_anim = load("res://Assets/SpriteFrames/sprite_frames_daisy.tres")
var freesia_anim = load("res://Assets/SpriteFrames/sprite_frames_freesia.tres")
var poppy_anim = load("res://Assets/SpriteFrames/sprite_frames_poppy.tres")
var rose_anim = load("res://Assets/SpriteFrames/sprite_frames_rose.tres")

var water_level = 100.0

func setup(new_flower_type):
	flowerType = new_flower_type
	
func _process(delta: float) -> void:
	water_level -= delta
	$ProgressBar.value = water_level
	if(water_level <= 50 and water_level >= 1):
		$"Flower Animation".play("wilted")
	elif(water_level <= 0):
		queue_free()
	else:
		$"Flower Animation".play("default")

func _on_timer_timeout() -> void:
	if(currentStage == GrowthStage.SPROUT):
		match flowerType:
			FlowerType.DAISY:			
				$"Flower Animation".sprite_frames = daisy_anim
			FlowerType.FREESIA:			
				$"Flower Animation".sprite_frames = freesia_anim
			FlowerType.POPPY:			
				$"Flower Animation".sprite_frames = poppy_anim
			FlowerType.ROSE:			
				$"Flower Animation".sprite_frames = rose_anim
		$"Flower Animation".play()
		currentStage = GrowthStage.FLOWER
	elif(currentStage == GrowthStage.FLOWER):
		var new_coin = coin_scene.instantiate()
		match flowerType:
			FlowerType.DAISY:		
				new_coin.setup(1)
			FlowerType.FREESIA:		
				new_coin.setup(3)
			FlowerType.POPPY:		
				new_coin.setup(5)
			FlowerType.ROSE:		
				new_coin.setup(10)
		add_child(new_coin)
		var angle = randf_range(-6.28, 6.28)
		var x = cos(angle) * 50.0
		var y = sin(angle) * 50.0
		new_coin.set_drop_spot(Vector2(global_position.x + x,global_position.y + y))
		new_coin.reparent(get_parent())
		
func water(amt_of_water):
	$ProgressBar.visible = true
	$ProgressBar/progressBarTimer.start()
	water_level += amt_of_water
	if(water_level > 100):
		water_level = 100
		$ProgressBar.visible = false


func _on_progress_bar_timer_timeout() -> void:
	$ProgressBar.visible = false
