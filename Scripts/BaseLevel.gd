extends Node

onready var position_ref = get_node("Position2D")
onready var game = get_node("/root/Game")

func _ready():
	remove_child(position_ref)
	game.pos_ref = position_ref
	
	TimerGenerator.generate_timer(0.1, "_lock_on_pos", self).start()

func _lock_on_pos():
	InstanceHelper.get_game().get_node("LeftKnob").target_pos = position_ref.get_global_pos()
	InstanceHelper.get_game().get_node("RightKnob").target_pos = position_ref.get_global_pos()
	InstanceHelper.get_game().get_node("LeftKnob")._lock_on_pos()
	InstanceHelper.get_game().get_node("RightKnob")._lock_on_pos()