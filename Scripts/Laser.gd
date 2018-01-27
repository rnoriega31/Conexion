extends Node2D

onready var raycast = get_node("RayCast2D")
var conexion_ref

func _ready():
	if !is_in_group("ignore"):
		raycast.add_exception(get_node("KinematicBody2D"))
		conexion_ref = InstanceHelper.get_conexion()
		set_process(true)

func _process(delta):
	if raycast.is_colliding():
		conexion_ref.set_pos(raycast.get_collision_point())
	else:
		conexion_ref.set_pos(Vector2(2000, 2000))