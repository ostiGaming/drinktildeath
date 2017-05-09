extends Node

var Player = preload('res://player.gd');

onready var event_selector = get_node("hud/theme/event_selector")

func _ready():
	set_process_input(true)

func _process(delta):
	pass
	
func _input(event):
	if event.is_action_released("ui_accept"):
		event_selector.randomize_event()