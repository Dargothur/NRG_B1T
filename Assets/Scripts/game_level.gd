extends Node2D

var currentWave = 0

@onready
var money_label = $VBoxContainer/PlayerCurrencyLabel

var aphid_scene = load("res://Assets/Objects/aphid.tscn")

var spawn_areas

func _ready():
	GameMaster.player_label_position = money_label.global_position + Vector2(75,75)
	spawn_areas = get_tree().get_nodes_in_group("spawn_areas")
	
func _process(delta):
	money_label.text = "$%d" % [GameMaster.player_currency]
	
func _on_wave_timer_timeout() -> void:
	match currentWave:
		0:
			for n in 5:
				var spawn_to_use : StaticBody2D = spawn_areas[randi_range(0,2)]
				var rect : Rect2 = spawn_to_use.get_child(0).shape.get_rect()
				var x = randi_range(spawn_to_use.global_position.x, spawn_to_use.global_position.x+rect.size.x)
				var y = randi_range(spawn_to_use.global_position.y, spawn_to_use.global_position.y+rect.size.y)
				var rand_point = Vector2(x,y)
				#var new_aphid = aphid_scene.instantiate()
				#add_child(new_aphid)
				#new_aphid.setup(rand_point)
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
	currentWave += 1
