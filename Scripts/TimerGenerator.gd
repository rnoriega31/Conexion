extends Node

func generate_timer(duration, callback_name, target_object, one_shot = true, parameters = []):
	var timer = Timer.new()
	timer.set_one_shot(one_shot)
	timer.set_timer_process_mode(Timer.TIMER_PROCESS_IDLE)
	timer.set_wait_time(duration)
	timer.connect("timeout", target_object, callback_name, parameters)
	target_object.add_child(timer)
	
	return timer