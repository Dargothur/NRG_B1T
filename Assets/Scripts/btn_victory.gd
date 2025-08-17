extends Button

func _on_mouse_entered() -> void:
	global_position -= Vector2(0,10)

func _on_mouse_exited() -> void:
	global_position += Vector2(0,10)

func _on_pressed() -> void:
	if GameMaster.player_currency >= 9999:
		$Victory.play()
		$"../../../lblVictory".visible = true
		$"../../../btnReturnToMainMenu".visible = true
