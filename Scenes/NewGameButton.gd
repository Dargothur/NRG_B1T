extends Button

var master

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = $"."
	button.pressed.connect(_button_pressed)
	master = get_tree().root.get_child(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _button_pressed():
	master.loadGameLevel()
