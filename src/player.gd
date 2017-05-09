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

# from http://mkweb.bcgsc.ca/colorblind/
# fuck this, no constant evaluation
const COLORS = [
	Color(230/255.0, 159/255.0, 0,         1), # orange
	Color(86/255.0,  180/255.0, 233/255.0, 1), # sky blue
	Color(0,         158/255.0, 115/255.0, 1), # turquoise
	Color(240/255.0, 228/255.0, 66/255.0,  1), # yellow
	Color(0,         114/255.0, 178/255.0, 1), # blue
	Color(213/255.0, 94/255.0,  0,         1), # vermillion
];

export(Color) var color = null # //Color.new(0.5, 0.5, 0.5, 1.0);
export var weapon = WEAPONS.Unarmed setget set_weapon;
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

func set_weapon(value):
	weapon = value
	emit_signal("updated")