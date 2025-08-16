extends Area2D

var daisy = load("res://Assets/Images/Flowers/Daisy/icnDaisy.png")
var freesia = load("res://Assets/Images/Flowers/Freesia/icnFreesia.png")
var poppy = load("res://Assets/Images/Flowers/Poppy/icnPoppy.png")
var rose = load("res://Assets/Images/Flowers/Rose/icnRose.png")
var vines = load("res://Assets/Images/Flowers/Vines/icnVines.png")
var sprinker = load("res://Assets/Images/Sprinkler/icnSprinkler.png")
var watering_can = load("res://Assets/Images/Watering Can/Watering-Can.png")
var bug_killer = load("res://Assets/Images/Fly Swatter/Fly Swatter.png")

var spawn_ready = true

func _on_mouse_entered() -> void:
	GameMaster.in_garden = true
	match GameMaster.current_tool:
		GameMaster.Tool.DAISY:
			Input.set_custom_mouse_cursor(daisy)
		GameMaster.Tool.FREESIA:
			Input.set_custom_mouse_cursor(freesia)
		GameMaster.Tool.POPPY:
			Input.set_custom_mouse_cursor(poppy)
		GameMaster.Tool.ROSE:
			Input.set_custom_mouse_cursor(rose)
		GameMaster.Tool.VINES:
			Input.set_custom_mouse_cursor(vines)
		GameMaster.Tool.SPRINKLER:
			Input.set_custom_mouse_cursor(sprinker)
		GameMaster.Tool.WATERING_CAN:
			Input.set_custom_mouse_cursor(watering_can)
		GameMaster.Tool.BUG_KILLER:
			Input.set_custom_mouse_cursor(bug_killer)


func _on_mouse_exited() -> void:
	GameMaster.in_garden = false
	Input.set_custom_mouse_cursor(null)
	
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("use_tool") and GameMaster.in_garden and spawn_ready:
		match GameMaster.current_tool:
			GameMaster.Tool.DAISY:
				if(GameMaster.player_currency >= 3):
					var scnFlower = load("res://Assets/Objects/flower.tscn")
					var new_flower = scnFlower.instantiate()
					new_flower.setup(new_flower.FlowerType.DAISY)
					add_child(new_flower)
					new_flower.global_position = get_global_mouse_position()
					spawn_ready = false
					GameMaster.player_currency -= 3
			GameMaster.Tool.FREESIA:
				if(GameMaster.player_currency >= 30):
					var scnFlower = load("res://Assets/Objects/flower.tscn")
					var new_flower = scnFlower.instantiate()
					new_flower.setup(new_flower.FlowerType.FREESIA)
					add_child(new_flower)
					new_flower.global_position = get_global_mouse_position()
					spawn_ready = false
					GameMaster.player_currency -= 30
			GameMaster.Tool.POPPY:
				if(GameMaster.player_currency >= 50):
					var scnFlower = load("res://Assets/Objects/flower.tscn")
					var new_flower = scnFlower.instantiate()
					new_flower.setup(new_flower.FlowerType.POPPY)
					add_child(new_flower)
					new_flower.global_position = get_global_mouse_position()
					spawn_ready = false
					GameMaster.player_currency -= 50
			GameMaster.Tool.ROSE:
				if(GameMaster.player_currency >= 100):
					var scnFlower = load("res://Assets/Objects/flower.tscn")
					var new_flower = scnFlower.instantiate()
					new_flower.setup(new_flower.FlowerType.ROSE)
					add_child(new_flower)
					new_flower.global_position = get_global_mouse_position()
					spawn_ready = false
					GameMaster.player_currency -= 100
			GameMaster.Tool.VINES:
				if(GameMaster.player_currency >= 100):
					var scnVines = load("res://Assets/Objects/vines.tscn")
					var new_vines = scnVines.instantiate()
					add_child(new_vines)
					new_vines.global_position = get_global_mouse_position()
					spawn_ready = false
					GameMaster.player_currency -= 100
			GameMaster.Tool.SPRINKLER:
				if(GameMaster.player_currency >= 100):
					var scnSprinkler = load("res://Assets/Objects/sprinkler.tscn")
					var new_sprinker = scnSprinkler.instantiate()
					add_child(new_sprinker)
					new_sprinker.global_position = get_global_mouse_position()
					spawn_ready = false
					GameMaster.player_currency -= 100
			GameMaster.Tool.WATERING_CAN:
				pass
			GameMaster.Tool.BUG_KILLER:
				pass

func _on_spawn_timer_timeout() -> void:
	spawn_ready = true
