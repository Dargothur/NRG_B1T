extends Area2D

var daisy = load("res://Assets/Images/Flowers/Daisy/icnDaisy.png")
var freesia = load("res://Assets/Images/Flowers/Freesia/icnFreesia.png")
var poppy = load("res://Assets/Images/Flowers/Poppy/icnPoppy.png")
var rose = load("res://Assets/Images/Flowers/Rose/icnRose.png")

var spawn_ready = true

func _on_mouse_entered() -> void:
	GameMaster.in_garden = true
	match GameMaster.current_tool:
		GameMaster.Tool.DAISY:
			print("Flower type is Daisy.")
			Input.set_custom_mouse_cursor(daisy)
		GameMaster.Tool.FREESIA:
			print("Flower type is Freesia.")
			Input.set_custom_mouse_cursor(freesia)
		GameMaster.Tool.POPPY:
			print("Flower type is Poppy.")
			Input.set_custom_mouse_cursor(poppy)
		GameMaster.Tool.ROSE:
			print("Flower type is Rose.")
			Input.set_custom_mouse_cursor(rose)


func _on_mouse_exited() -> void:
	GameMaster.in_garden = false
	
	
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

func _on_spawn_timer_timeout() -> void:
	spawn_ready = true
