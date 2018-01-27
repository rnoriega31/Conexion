extends Node

func _ready():
	pass

func instance_scene(parent, scene_name):
	var scene_res = load("res://Scenes/" + scene_name)
	var scene_instance = scene_res.instance()
	parent.add_child(scene_instance)

func get_conexion():
	return get_node("/root/Game/Conexion")