extends Node2D

var rotate_left = ""
var rotate_right = ""
var degrees_per_frame = 0.25

func _ready():
	TimerGenerator.generate_timer(0.05, "_lock_on_pos", self).start()
	TimerGenerator.generate_timer(0.7, "_allow_controls", self).start()

func _process(delta):
	if Input.is_action_pressed(rotate_left):
		set_rotd(get_rotd() + degrees_per_frame)
	elif Input.is_action_pressed(rotate_right):
		set_rotd(get_rotd() - degrees_per_frame)

func _lock_on_pos():
	var target_pos = get_node("../Position2D").get_global_pos()
	print(target_pos)
	
	set_rotd(rad2deg(atan2(get_global_pos().x - target_pos.x, get_global_pos().y - target_pos.y)))

func _allow_controls():
	set_process(true)