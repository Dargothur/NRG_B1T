extends Node2D

@onready
var money_label = $VBoxContainer/PlayerCurrencyLabel

func _ready():
	pass
	
func _process(delta):
	money_label.text = "$%.2f" % [GameMaster.player_currency]
