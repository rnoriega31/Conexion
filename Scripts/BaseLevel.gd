extends Node

onready var position_ref = get_node("Position2D")
onready var game = get_node("/root/Game")

func _ready():
	remove_child(position_ref)
	game.pos_ref = position_ref