extends AnimatableBody2D

var flowers
var target

var health = 100.0
var speed = 200.0
var bug_ready = false

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
	elif target != null and bug_ready:
		global_position = global_position.move_toward(target.global_position,delta * speed)
		if global_position == target.global_position:
			$AnimatedSprite2D.stop()
		else:
			$AnimatedSprite2D.play()
	else:
		pass
	
func update_flowers():
	flowers = get_tree().get_nodes_in_group("flowers")
	
func setup(new_position):
	sync_to_physics = false
	position = new_position
	global_position = new_position
	sync_to_physics = true


func _on_ready_timer_timeout() -> void:
	bug_ready = true
