extends Control

const EVENTS = [
	preload("events/weapon.tscn")
]

func randomize_event():
	randomize()
	var idx = int(rand_range(0, EVENTS.size()))
	var evt = EVENTS[idx].instance()
	var cur_evt = get_child(0)
	remove_child(cur_evt)
	cur_evt.queue_free()
	add_child(evt)
	
func _enter_tree():
	randomize_event()