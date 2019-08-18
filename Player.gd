extends KinematicBody2D

var speed : Vector2 = Vector2(150,0)
var current_lane = 1
onready var tween = $Tween
onready var anim = $AnimationPlayer
export var offset : Vector2 = Vector2.ZERO

const LANE_HEIGHTS = [120, 300, 480]

func _ready():
	restart_idle_animation()
		
func _process(delta):
	var new_lane = current_lane
	if Input.is_action_just_pressed("ui_up"):
		if current_lane > 0: new_lane = current_lane - 1
	if Input.is_action_just_pressed("ui_down"):
		if current_lane < 2: new_lane = current_lane + 1

	if new_lane != current_lane:
		anim.stop(false)
		tween.interpolate_property(
			self, "position:y", 
			self.position.y, LANE_HEIGHTS[new_lane] + offset.y, 0.5, Tween.TRANS_QUART, Tween.EASE_OUT)
		tween.start()
		current_lane = new_lane

	if !tween.is_active():
		position.y = LANE_HEIGHTS[current_lane] + offset.y

	move_and_collide(speed * delta)

func restart_idle_animation():
	anim.play("idle")
