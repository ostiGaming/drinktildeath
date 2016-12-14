const WEAPONS = {
	"Unarmed": 0, 
	"Knife": 1, 
	"Axe": 2, 
	"Chainsaw": 3
}

var icon = null;
var weapon = WEAPONS.Unarmed;
var hp = 25 setget set_hp;
var wounds = []; # array of current DoT inflicted

func add_wound(duration):
	self.wounds.append(duration)
	
func set_hp(value):
	hp = value
	if hp <= 0:
		print("Player killed.")