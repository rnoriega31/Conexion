extends Node2D

var rotate_left = ""
var rotate_right = ""
var degrees_per_frame = 0.25

func _ready():
	set_process(true)
	
	TimerGenerator.generate_timer(0.1, "_lock_on_pos", self).start()

func _process(delta):
	if Input.is_action_pressed(rotate_left):
		set_rotd(get_rotd() + degrees_per_frame)
	elif Input.is_action_pressed(rotate_right):
		set_rotd(get_rotd() - degrees_per_frame)

func _lock_on_pos():
	var target_pos = get_node("../Position2D")
	print(target_pos.get_global_pos())