extends Area2D

enum BugType {
	APHID,
	CATERPILLAR,
	GRASSHOPPER
}

var flowers
var target

var deep_crunch = preload("res://Assets/Sound Effects/Deep_Crunch.mp3")
var light_crunch = preload("res://Assets/Sound Effects/Light_Crunch.mp3")
var chomp_sound

var health = 100.0
var speed = 200.0
var bug_ready = false
var damage_value = 35.0

var aphid_sprites = load("res://Assets/SpriteFrames/sprite_frames_aphid.tres")
var caterpillar_sprites = load("res://Assets/SpriteFrames/sprite_frames_caterpillar.tres")
var grasshopper_sprites = load("res://Assets/SpriteFrames/sprite_frames_grasshopper.tres")

func _ready() -> void:
	flowers = get_tree().get_nodes_in_group("flowers")
	print(str(self.get_instance_id()) + " spawned")

func _physics_process(delta: float) -> void:
	if target == null:
		if flowers.size() > 0:
			var idx = randi_range(0, flowers.size() - 1)
			if(is_instance_valid(flowers[idx])):
				target = flowers[idx]
				look_at(target.position)
			else:
				flowers.remove_at(idx)
	elif target != null:
		global_position = global_position.move_toward(target.global_position,delta * speed)
		if global_position == target.global_position:
			$AnimatedSprite2D.stop()
			if $BiteCooldown.is_stopped():
				$BiteCooldown.start()
		else:
			$AnimatedSprite2D.play()
	else:
		pass
	
func update_flowers():
	flowers = get_tree().get_nodes_in_group("flowers")
	
func setup(bug_type, new_position):
	match bug_type:
		BugType.APHID:
			$AnimatedSprite2D.sprite_frames = aphid_sprites
		BugType.CATERPILLAR:
			$AnimatedSprite2D.sprite_frames = caterpillar_sprites
			health = 150.0
			speed = 100.0
			damage_value = 50
		BugType.GRASSHOPPER:
			$AnimatedSprite2D.sprite_frames = grasshopper_sprites
			health = 200.0
			speed = 300.0
			damage_value = 100
	global_position = new_position


func _on_bite_cooldown_timeout() -> void:
	print("in timeout..")
	if(is_instance_valid(target)):
		_play_chomp_sound()
		target.take_damage(damage_value)
		$BiteCooldown.start()
	else:
		$BiteCooldown.stop()

func take_damage(damage_amt):
	health -= damage_amt
	if health <= 0:
		queue_free()
		
func _play_chomp_sound() -> void:
	var randNum = randi_range(0, 1)
	match randNum:
		0:
			chomp_sound = deep_crunch
		1:
			chomp_sound = light_crunch
	$BugChomp.stream = chomp_sound
	$BugChomp.volume_db = randf_range(-5, 1)
	$BugChomp.pitch_scale = randf_range(1, 1.5)
	$BugChomp.play()
