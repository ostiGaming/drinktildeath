extends Control

var Player = preload('res://player.gd')

onready var found_weapon = get_node("found_weapon")
export(Object) var player;

func _ready():
	if !player: return
	
	randomize()
	var weapon = int(rand_range(0, Player.WEAPONS.size()))
	player.set_weapon(weapon)
	found_weapon.set_normal_texture(Player.WEAPONS_ICONS[player.weapon])