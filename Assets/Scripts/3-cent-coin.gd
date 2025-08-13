extends Area2D

var starting_position
var t = 0.0
var clicked = false
var trigger_sound = false

func _ready():
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_released() and !clicked:
		starting_position = $".".global_position
		clicked = true
		get_viewport().set_input_as_handled()

func _on_audio_stream_player_2d_finished() -> void:
	self.queue_free()

func _physics_process(delta: float) -> void:
	if(clicked):
		print(t)
		if(t < 1.0): 
			t += delta * 0.4
		else:
			trigger_sound = true
		$".".global_position = starting_position.lerp(Vector2(1200, 570), t)
		
	if(trigger_sound):
		clicked = false
		GameMaster.player_currency += 3
		$AudioStreamPlayer2D.play()
		self.visible = false
		$CollisionShape2D.disabled = true
		trigger_sound = false
		
