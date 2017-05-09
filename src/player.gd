const WEAPONS = {
	"Unarmed": 0, 
	"Knife": 1, 
	"Axe": 2, 
	"Chainsaw": 3
}

const WEAPONS_ICONS = [
	null,
	preload("res://icons/weapon_knife.png"),
	preload("res://icons/weapon_axe.png"),
	preload("res://icons/weapon_chainsaw.png"),
]

const COLORS = [
	Color(1, 0, 0, 1), # red
	Color(0, 1, 1, 1), # green
	Color(0, 0, 1, 1), # blue,	
	Color(1, 0, 1, 1), # purple,
	Color(1, 1, 0, 1), # yellow,	
	Color(0, 1, 1, 1), # ?
]

export(Color) var color = null # //Color.new(0.5, 0.5, 0.5, 1.0);
export var weapon = WEAPONS.Unarmed;
export var hp = 25 setget set_hp;
var wounds = []; # array of current DoT inflicted

signal updated;

func add_wound(duration):
	self.wounds.append(duration)
	
func set_hp(value):
	hp = value
	if hp <= 0:
		print("Player killed.")
	emit_signal("updated")