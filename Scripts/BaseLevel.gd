extends Node

onready var position_ref = get_node("Position2D")
onready var game = get_node("/root/Game")
onready var timer_label = get_node("TimerLabel")
export (int, 1, 60) var time_limit = 1
var timer_ref

func _ready():
	set_process(true)
	remove_child(position_ref)
	game.pos_ref = position_ref
	
	TimerGenerator.generate_timer(0.1, "_lock_on_pos", self).start()
	timer_ref = TimerGenerator.generate_timer(time_limit, "_timeout", self)
	timer_ref.start()

func _process(delta):
	timer_label.set_text("Timeout in: " + str(timer_ref.get_time_left()).left(4))

func _lock_on_pos():
	InstanceHelper.get_game().get_node("LeftKnob").target_pos = position_ref.get_global_pos()
	InstanceHelper.get_game().get_node("RightKnob").target_pos = position_ref.get_global_pos()
	InstanceHelper.get_game().get_node("LeftKnob")._lock_on_pos()
	InstanceHelper.get_game().get_node("RightKnob")._lock_on_pos()

func _timeout():
	print("ran out of time after " + str(time_limit) + " seconds")
	get_tree().change_scene("Scenes/Game.tscn")
	