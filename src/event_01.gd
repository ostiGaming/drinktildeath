extends Control

const Player = preload('res://player.gd')
onready var found_weapon = get_node("found_weapon")

func _ready():
	randomize()
	var weapon = int(rand_range(0, Player.WEAPONS.size()))
	found_weapon.set_normal_texture(Player.WEAPONS_ICONS[weapon])
