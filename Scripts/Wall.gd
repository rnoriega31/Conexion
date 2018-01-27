extends Node2D

onready var sprite = get_node("Sprite")
onready var conexion = InstanceHelper.get_conexion().get_node("Sprite")

func _ready():
	pass

func _on_area_enter(area):
	if area.get_name() == "Player":
		get_tree().change_scene("Scenes/Game.tscn")