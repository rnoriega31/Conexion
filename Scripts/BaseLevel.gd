extends Node

onready var position_ref = get_node("Position2D")
onready var game = get_node("/root/Game")
export (int, 1, 60) var time_limit = 1

func _ready():
	remove_child(position_ref)
	game.pos_ref = position_ref
	
	TimerGenerator.generate_timer(0.1, "_lock_on_pos", self).start()
	TimerGenerator.generate_timer(time_limit, "_timeout", self).start()

func _lock_on_pos():
	InstanceHelper.get_game().get_node("LeftKnob").target_pos = position_ref.get_global_pos()
	InstanceHelper.get_game().get_node("RightKnob").target_pos = position_ref.get_global_pos()
	InstanceHelper.get_game().get_node("LeftKnob")._lock_on_pos()
	InstanceHelper.get_game().get_node("RightKnob")._lock_on_pos()

func _timeout():
	print("ran out of time after " + str(time_limit) + " seconds")
	#get_tree().change_scene("Scenes/Game.tscn")
	