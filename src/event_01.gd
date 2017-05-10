extends Control

var Player = preload('res://player.gd')

onready var found_weapon = get_node("found_weapon")
export(Object) var player;

func _ready():
	if !player: return
	
	randomize()
	# TODO: make the good RNG
	var weapon = randi() % (Player.WEAPONS.size() - 1) + 1
	player.set_weapon(weapon)
	found_weapon.set_normal_texture(Player.WEAPONS_ICONS[player.weapon])