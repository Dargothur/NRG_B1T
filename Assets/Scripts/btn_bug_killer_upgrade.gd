extends Button


func _on_mouse_entered() -> void:
	global_position -= Vector2(0,10)


func _on_mouse_exited() -> void:
	global_position += Vector2(0,10)


func _on_pressed() -> void:
	if GameMaster.player_currency >= GameMaster.weapon_upgrade_cost:
		GameMaster.weapon_lv += 1
		$Upgrade_Noise.play()
		GameMaster.player_currency -= GameMaster.weapon_upgrade_cost
		GameMaster.weapon_upgrade_cost += GameMaster.weapon_upgrade_cost
		$"../../../lblBKUpgradePrice".text = "$" + str(GameMaster.weapon_upgrade_cost)
