extends Panel
const Player = preload("res://player.gd")

export(Object) var player setget set_player;
onready var color = get_node("color")
onready var hp = get_node("info/hp")
onready var weapon = get_node("info/weapon")
onready var anim = get_node("_anim")

export var is_current = true

var dirty = false

func _ready():
	set_process(true);
	set_process_input(true);
	hp.set_process_input(true);

func _process(delta):
	if !self.dirty || self.player == null:
		return
	
	self.dirty = false
	hp.set_text("%s" % self.player.hp);
	weapon.set_texture(Player.WEAPONS_ICONS[self.player.weapon]);
	
	# color
	var stylebox = StyleBoxFlat.new();
	stylebox.set_bg_color(self.player.color);
	color.add_style_override("panel", stylebox)

func _input_event(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		self.player.set_hp(self.player.hp - 1)

func set_player(value):
	if !value: return
	
	value.connect("updated", self, "_on_player_updated")
	player = value
	self.dirty = true

func do_hide():
	anim.play_backwards("show")

func do_show():
	anim.play("show")

func _on_player_updated():
	self.dirty = true