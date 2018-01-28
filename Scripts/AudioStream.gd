extends Node

func create_sound_stream(audio_stream):
	_create_sound_stream(audio_stream, self, false)

func create_managed_sound_stream(audio_stream, owner, loops = true):
	_create_sound_stream(audio_stream, owner, loops)

func _create_sound_stream(audio_stream, owner, loops):
	var stream_player = StreamPlayer.new()
	stream_player.set_autoplay(true)
	stream_player.set_stream(audio_stream)
	owner.add_child(stream_player)
	
	
	return stream_player

func on_audio_finished(stream_player):
	stream_player.queue_free()