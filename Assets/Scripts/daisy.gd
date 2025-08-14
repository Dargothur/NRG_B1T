extends Area2D

enum GrowthStage {
	SPROUT = 0,
	FLOWER
}

var flip = [-1,1]

var currentStage = GrowthStage.SPROUT

@export var coin_scene: PackedScene = load("res://Assets/Objects/coin.tscn")

func _on_timer_timeout() -> void:
	if(currentStage == GrowthStage.SPROUT):
		$"Daisy Animation".sprite_frames = load("res://Assets/SpriteFrames/sprite_frames_daisy.tres")
		$"Daisy Animation".play()
		currentStage = GrowthStage.FLOWER
	elif(currentStage == GrowthStage.FLOWER):
		var new_coin = coin_scene.instantiate()
		add_child(new_coin)
		var angle = randf_range(-6.28, 6.28)
		var x = cos(angle) * 50.0
		var y = sin(angle) * 50.0
		new_coin.set_drop_spot(Vector2(global_position.x + x,global_position.y + y))
