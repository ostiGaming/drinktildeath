extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var visible_characters_ratio = 1.0 setget set_visible_characters_ratio

# in char/s
export var reveal_speed = -1
onready var text_length = get_text().length()


func set_visible_characters_ratio(value):
	if !text_length: return;
	
	visible_characters_ratio = value
	var visible_chars = floor(lerp(0, text_length, visible_characters_ratio))
	set_visible_characters(visible_chars)