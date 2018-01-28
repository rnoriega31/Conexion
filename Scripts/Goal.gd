extends Node2D

func _ready():
	pass
	
func _on_area_enter(area):
	if area.get_name() == "Player":
		InstanceHelper.get_game()._load_next_level()
		ASGenerator.create_sound_stream(load("res://Resources/LevelComplete.ogg"))