extends Button


func _on_mouse_entered() -> void:
	global_position -= Vector2(0,10)


func _on_mouse_exited() -> void:
	global_position += Vector2(0,10)


func _on_pressed() -> void:
	if GameMaster.player_currency >= GameMaster.watering_upgrade_cost:
		GameMaster.watering_lv += 1
		$"../../cntrBugKillerUpgrade/btnBugKillerUpgrade/Upgrade_Noise".play()
		GameMaster.player_currency -= GameMaster.watering_upgrade_cost
		GameMaster.watering_upgrade_cost += GameMaster.watering_upgrade_cost
		$"../../../lblWCUpgradePrice".text = "$" + str(GameMaster.watering_upgrade_cost)
