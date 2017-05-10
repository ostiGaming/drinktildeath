extends Control

const EVENTS = [
	preload("events/weapon.tscn"),
	preload("events/panic.tscn")
]

onready var game = get_node("/root/game")

func randomize_event():
	randomize()
	# remove the current event
	var cur_evt = get_child(0)
	cur_evt.queue_free()
	remove_child(cur_evt)
	
	# add the next event
	var evt = EVENTS[randi() % EVENTS.size()].instance()
	evt.player = game.get_current_player()
	add_child(evt)
	
func _ready():
	randomize_event()