extends Node2D

onready var snitch_counter : Label = $HUD/SnitchCounter

var snitch_count : int = 0

func update_snitch_count(add_value):
	snitch_count += add_value
	snitch_counter.text = str(snitch_count)
	print("snitch captured")

func _ready():
	$UpperLane.init_lane()