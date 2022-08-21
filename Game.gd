extends Node2D

var canvas = preload("res://Canvas.tscn")
var sym_line = preload("res://Sym_line.tscn")
var ball_black = preload("res://Ball_black.tscn")
var ball_white = preload("res://Ball_white.tscn")
var interface = preload("res://Interface.tscn")
var star = preload("res://Star.tscn")
var finish = preload("res://Finish.tscn")
onready var screen_size = get_viewport().size
var children = []
func _ready():
	#add_child(canvas.instance())
	#add_child(sym_line.instance())
	#add_child(ball_black.instance())
	#add_child(interface.instance())
	pass
	
func _process(delta):
	if  Input.is_action_just_released("restart_button"):
		Globals.restart = true
	if Globals.restart:
		Globals.spend = Globals.limit
		#$Canvas.replace_by(canvas.instance())
		#$Sym_line.replace_by(sym_line.instance())
		#$Ball.replace_by(ball_black.instance())
		for ch in get_children():
			ch.remove()
		add_child(sym_line.instance())
		add_child(canvas.instance())
		add_child(star.instance())
		var finish_instance = finish.instance()
		#finish_instance = int(sqrt(1920*1920+1080*1080)/sqrt(pow(screen_size.x,2)*+pow(screen_size.y,2)))
		add_child(finish_instance)
		add_child(ball_black.instance())
		#Globals.spend = Globals.limit
		add_child(interface.instance())
		Globals.restart = false
