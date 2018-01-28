extends Node

var pos_ref
var levels_array  = ["Level_1.tscn", "Level_2.tscn", "Level_3.tscn", "Level_4.tscn", "Level_5.tscn", "EndGame.tscn"]
var cur_level = 0
signal reset

func _ready():
	add_child(pos_ref)

func _load_next_level():
	_delete_current_level()
	_add_next_level()

func _add_next_level():
	cur_level += 1
	
	if cur_level < levels_array.size():
		print("adding level " + levels_array[cur_level])
		InstanceHelper.instance_scene(self, levels_array[cur_level])

func _delete_current_level():
	var node_name = levels_array[cur_level].left(levels_array[cur_level].find("."))
	get_node(node_name).queue_free()