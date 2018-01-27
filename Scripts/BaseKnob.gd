extends Node2D

var rotate_left = ""
var rotate_right = ""
var degrees_per_frame = 0.25

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed(rotate_left):
		set_rotd(get_rotd() + degrees_per_frame)
	elif Input.is_action_pressed(rotate_right):
		set_rotd(get_rotd() - degrees_per_frame)