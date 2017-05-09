extends Control

const EVENTS = [
	preload("events/weapon.tscn")
]

onready var game = get_node("/root/game")

func randomize_event():
	randomize()
	# remove the current event
	var cur_evt = get_child(0)
	remove_child(cur_evt)
	cur_evt.queue_free()
	
	# add the next event
	var idx = int(rand_range(0, EVENTS.size()))
	var evt = EVENTS[idx].instance()
	evt.player = game.get_current_player()
	add_child(evt)
	
func _ready():
	randomize_event()