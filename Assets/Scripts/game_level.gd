extends Node2D

@onready
var money_label = $VBoxContainer/PlayerCurrencyLabel

func _ready():
	GameMaster.player_label_position = money_label.global_position + Vector2(75,75)
	
func _process(delta):
	money_label.text = "$%d" % [GameMaster.player_currency]
