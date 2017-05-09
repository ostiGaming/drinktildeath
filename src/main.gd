extends Node

var Player = preload('res://player.gd')

onready var event_selector = get_node("hud/theme/event_selector")
onready var players_node = get_node("hud/theme/players_hud")

func _ready():
	set_process_input(true)

func _process(delta):
	pass
	
func _input(event):
	if event.is_action_released("ui_accept"):
		players_node.next_player()
		event_selector.randomize_event()

# TODO: move this to autoload world
func get_current_player():
	var players_manager = get_node("hud/theme/players_hud")
	return players_manager.players[players_manager.current_player]