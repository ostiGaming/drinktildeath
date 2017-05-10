extends Control

var Player = preload('res://player.gd')

onready var weapon = get_node("weapon")
export(Object) var player;

func _ready():
	if !player: return
	
	weapon.set_normal_texture(Player.WEAPONS_ICONS[player.weapon])
	player.set_weapon(Player.WEAPONS.Unarmed)