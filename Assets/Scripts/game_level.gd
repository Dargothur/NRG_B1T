extends Node2D

var game_started = false

var currentWave = 0

var gameover = 0

@onready
var money_label = $VBoxContainer/PlayerCurrencyLabel

var bug_scene = load("res://Assets/Objects/bug.tscn")

var spawn_areas

var max_no_of_bugs = currentWave + 2

func _ready():
	GameMaster.player_label_position = money_label.global_position + Vector2(75,75)
	spawn_areas = get_tree().get_nodes_in_group("spawn_areas")
	
func _process(delta):
	money_label.text = "$%d" % [GameMaster.player_currency]
	var flowers = get_tree().get_nodes_in_group("flowers")
	if flowers.size() > 0:
		game_started = true
		if $WaveTimer.is_stopped():
			$WaveTimer.start()
	elif game_started:
		gameover += 1
		if gameover == 1:
			$Game_Over.play()
		$lblGameOver.visible = true
		$btnReturnToMainMenu.visible = true
	
func _on_wave_timer_timeout() -> void:
	var curr_no_of_bugs = 0
	for n in randi_range(1,currentWave + 2):
		if curr_no_of_bugs < max_no_of_bugs:
			var spawn_to_use : StaticBody2D = spawn_areas[randi_range(0,2)]
			var rect : Rect2 = spawn_to_use.get_child(0).shape.get_rect()
			var x = randi_range(spawn_to_use.global_position.x, spawn_to_use.global_position.x+rect.size.x)
			var y = randi_range(spawn_to_use.global_position.y, spawn_to_use.global_position.y+rect.size.y)
			var rand_point = Vector2(x,y)
			var new_aphid = bug_scene.instantiate()
			add_child(new_aphid)
			new_aphid.setup(new_aphid.BugType.APHID, rand_point)
			curr_no_of_bugs += 1
	if currentWave >= 1:
		for n in randi_range(1,currentWave + 2):
			if curr_no_of_bugs < max_no_of_bugs:
				var spawn_to_use : StaticBody2D = spawn_areas[randi_range(0,2)]
				var rect : Rect2 = spawn_to_use.get_child(0).shape.get_rect()
				var x = randi_range(spawn_to_use.global_position.x, spawn_to_use.global_position.x+rect.size.x)
				var y = randi_range(spawn_to_use.global_position.y, spawn_to_use.global_position.y+rect.size.y)
				var rand_point = Vector2(x,y)
				var new_caterpillar = bug_scene.instantiate()
				add_child(new_caterpillar)
				new_caterpillar.setup(new_caterpillar.BugType.CATERPILLAR, rand_point)
				curr_no_of_bugs += 1
	if currentWave >= 2:
		for n in randi_range(1,currentWave + 2):
			if curr_no_of_bugs < max_no_of_bugs:
				var spawn_to_use : StaticBody2D = spawn_areas[randi_range(0,2)]
				var rect : Rect2 = spawn_to_use.get_child(0).shape.get_rect()
				var x = randi_range(spawn_to_use.global_position.x, spawn_to_use.global_position.x+rect.size.x)
				var y = randi_range(spawn_to_use.global_position.y, spawn_to_use.global_position.y+rect.size.y)
				var rand_point = Vector2(x,y)
				var new_grasshopper = bug_scene.instantiate()
				add_child(new_grasshopper)
				new_grasshopper.setup(new_grasshopper.BugType.GRASSHOPPER, rand_point)
				curr_no_of_bugs += 1
	currentWave += 1
	max_no_of_bugs += 1
