extends Area2D

enum GrowthStage {
	SPROUT = 0,
	FLOWER
}

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
