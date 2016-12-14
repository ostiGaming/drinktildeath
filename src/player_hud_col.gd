extends VBoxContainer
const Player = preload("res://player.gd")

var player = null;
onready var color = get_node("color")
onready var hp = get_node("hp")
onready var weapon = get_node("weapon")

func _ready():
	set_process(true);
	set_process_input(true);
	hp.set_process_input(true);

func _process(delta):
	if self.player == null:
		return
	
	hp.set_text("%s" % self.player.hp);
	color.set_texture(self.player.icon);
	weapon.set_texture(Player.WEAPONS_ICONS[self.player.weapon])

func _input_event(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		self.player.set_hp(self.player.hp - 1)
