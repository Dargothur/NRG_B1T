extends Area2D

@export var radius = 100
@export var wait_time = 6

var valid_targets = []
var can_chomp = false

func _ready():
	$Trap_Area.shape.radius = radius
	$Chomp_Time.wait_time = wait_time
	$FlytrapAni.play()
	$FlytrapClosed.visible = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if can_chomp and !valid_targets.is_empty():
		var target = valid_targets[0]
		$FlytrapAni.visible = false
		$FlytrapClosed.visible = true
		#bug takes damage here
		can_chomp = false
	if can_chomp:
		$FlytrapClosed.visible = false
		$FlytrapAni.visible = true

func _on_body_entered(body) -> void:
	if body.is_in_group("bugs"):
		valid_targets.append(body)
	pass

func _on_body_exited(body) -> void:
	if body.is_in_group("bugs"):
		valid_targets.erase(body)
		


func _on_chomp_time_timeout():
	can_chomp = true
