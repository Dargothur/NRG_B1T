extends Area2D

@export var radius = 50
@export var wait_time = 6
@export var damage = 500

var valid_targets = []
var can_chomp = false

func _ready():
	$Trap_Area.shape.radius = radius
	$Chomp_Time.wait_time = wait_time
	$FlytrapAni.play()
	$FlytrapClosed.visible = false	
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _process(delta):
	if can_chomp and !valid_targets.is_empty():
		for target in valid_targets:
			if is_instance_valid(target):
				$FlytrapAni.visible = false
				$FlytrapClosed.visible = true
				target.take_damage(damage)
				_play_chomp_audio()
				$Chomp_Time.start()
				can_chomp = false
				break

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bugs"):
		valid_targets.append(area)

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("bugs"):
		valid_targets.erase(area)


func _on_chomp_time_timeout():
	$FlytrapAni.visible = true
	$FlytrapClosed.visible = false
	can_chomp = true

func _play_chomp_audio() -> void:
	$Chomp_Sound.volume_db = randf_range(-4, 1)
	$Chomp_Sound.pitch_scale = randf_range(1, 1.1)
	$Chomp_Sound.play()
