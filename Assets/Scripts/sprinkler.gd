extends Area2D

const flower = preload("res://Assets/Scripts/flower.gd")

@export var radius = 100
@export var water = 5
@export var spray_time = 6

func _ready():
	$Sprinkler_Area.shape.radius = radius
	$sprayTimer.wait_time = spray_time
	$sprayTimer.start()

func _process(delta): 
	$Sprinkler_Animation.rotation_degrees += 45 * delta 

func _on_spray_timer_timeout():
	$South.emitting = true
	$East.emitting = true
	$West.emitting = true
	$North.emitting = true
	var objects = get_overlapping_areas()
	for obj in objects:
		if obj is flower:
			obj.water(water)
