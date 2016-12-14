extends Panel
const Player = preload('res://player.gd');

func _ready():
	var players = [];
	
	for i in range(6):
		var player_node = get_node("players_container/player%s" % i)
		var p = Player.new()
		p.icon = load("res://icons/player_%s.png" % Player.COLORS[i])
		p.weapon = Player.WEAPONS.Axe
		player_node.player = p
