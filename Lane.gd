extends Node2D

var snitch: PackedScene = preload("res://Snitch.tscn")
var world : Node2D

func init_lane():
	world = get_parent()
	var s : Area2D
	for i in range (0, 1000, 100):
		s = snitch.instance()
		add_child(s)
		s.position = Vector2(i, 0)
		s.update_snitch_count = funcref (world, "update_snitch_count")
