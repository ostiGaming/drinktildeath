tool
extends Node2D

export var radius = 10;
export(Color) var color = Color("white");

func _draw():
	draw_circle(get_pos(), radius, color);