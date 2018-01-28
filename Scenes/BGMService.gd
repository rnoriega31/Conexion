extends Node

onready var stream = get_node("StreamPlayer")
export (String, FILE) var song = null

func _set_song(song, offset = 0):
	if song != null:
		stream.set_stream(load(song))
		stream.play(offset)