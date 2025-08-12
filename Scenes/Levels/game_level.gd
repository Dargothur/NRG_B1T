extends Node2D

@onready
var money_label = $VBoxContainer/Label

func _ready():
	money_label.text = "$10"
	
func _process(delta):
	pass
