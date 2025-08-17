extends Area2D

const bug = preload("res://Assets/Scripts/bug.gd")

var lvl = GameMaster.weapon_lv
var weapon_ready = true
var damage_value = 10.0 * lvl

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if(Input.is_action_pressed("use_tool") and GameMaster.current_tool == GameMaster.Tool.BUG_KILLER and weapon_ready):
		var objects = get_overlapping_areas()
		for obj in objects:
			if(obj is bug):
				obj.take_damage(damage_value * lvl)
				_play_smack_audio()
				$"small-particle".emitting = true
				weapon_ready = false
				$WeaponCD.start()


func _on_weapon_cd_timeout() -> void:
	weapon_ready = true

func _play_smack_audio() -> void:
	$AudioStreamPlayer2D.volume_db = randf_range(-20, -15)
	$AudioStreamPlayer2D.pitch_scale = randf_range(1, 1.2)
	$AudioStreamPlayer2D.play()
