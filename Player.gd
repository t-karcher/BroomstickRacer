extends Node2D

var dir : Vector2 = Vector2.ZERO
var speed = 150
var rail = 1

const RAIL_HEIGHTS = [120, 300, 480]

func _ready():
	$simon_riding_broomstick/AnimationPlayer.play("idle")

func _process(delta):
	var new_rail = rail
	dir = Vector2(300,0)
	if Input.is_action_pressed("ui_left"):
		dir += Vector2(-speed,0)
	if Input.is_action_pressed("ui_right"):
		dir += Vector2(speed,0)
	if Input.is_action_just_pressed("ui_up"):
		if rail > 0: new_rail = rail - 1
	if Input.is_action_just_pressed("ui_down"):
		if rail < 2: new_rail = rail + 1

	if new_rail != rail:
		var tween = Tween.new()
		add_child(tween)
		tween.interpolate_property(
			self, "position:y", 
			self.position.y, RAIL_HEIGHTS[new_rail], 0.5, Tween.TRANS_QUART, Tween.EASE_OUT)
		tween.start()
		rail = new_rail

	position += dir * delta
	dir *= .9

