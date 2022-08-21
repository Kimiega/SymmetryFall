extends Node2D

var game = preload("res://Game.tscn")
func _ready():
	OS.window_fullscreen = false
	OS.window_maximized = true
	pass

func _process(delta):
	if Globals.start:
		for x in get_children():
			remove_child(x)
		add_child(game.instance())
		Globals.level +=1
		Globals.line = null
		Globals.ball_point = null
		Globals.star_point = null
		Globals.finish_point = null
		Globals.restart = true
		Globals.start = false
