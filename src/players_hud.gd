const Player = preload('res://player.gd')
const PlayerHUD = preload('res://player_hud.tscn')

const MAX_PLAYERS = 6
export var players_count = MAX_PLAYERS
export var current_player = 0 setget set_current_player

onready var anim = get_node("_anim")

var container
var player_node_proto

# TODO: refactor me away
export var players = []

func _ready():
	container = get_node("players_container")

	_seed_players()
	# let's hide unused players
	# for i in range(players_count, MAX_PLAYERS):
	#   container.get_child(i).hide()
	
	for i in range(0, MAX_PLAYERS):
		if i == current_player: continue
		container.get_child(i).do_hide()

func set_current_player(value):
	if !container: return
	value = min(max(value, 0), players.size() - 1) # [0, MAX_PLAYERS]
	if current_player == value: return
	
	container.get_child(current_player).do_hide()
	container.get_child(value).do_show()
	current_player = value

func _seed_players():
	for i in range(0, players_count):
		players.append(create_player(i))
		container.get_child(i).player = players[i]

func create_player(i):
	var p = Player.new()
	p.color = Player.COLORS[i]
	p.weapon = Player.WEAPONS.Knife
	return p
	
func next_player():
	set_current_player((current_player + 1) % players_count)
