extends Node2D

var pressed = false
var active_line
var circ_line = preload("res://circle_line.tscn")
var circ_line_white = preload("res://circle_line_white.tscn")
var circ_line_inst
var prev_pos = Vector2()
var numberOfPoints = 1
func _ready():
	pass

func _process(delta):
	pass
	#if Input.is_action_just_pressed("user_draw_line"):
#		prev_pos = get_global_mouse_position()
#	if Input.is_action_pressed("user_draw_line"):
#		draw(get_global_mouse_position())
#		prev_pos = get_global_mouse_position()
	
func draw(pos):
	numberOfPoints = int(sqrt(pow(pos.x-prev_pos.x,2) + pow(pos.y-prev_pos.y,2)))
	for i in range(numberOfPoints):
		if Globals.spend<=0:
			break
		Globals.spend -= 1
		#print(Globals.spend)
		var t_pos = Vector2((pos.x-prev_pos.x)/numberOfPoints*i+prev_pos.x,(pos.y-prev_pos.y)/numberOfPoints*i+prev_pos.y)
		draw_point(t_pos)
		draw_point(Globals.sym_coords(t_pos))

func draw_point(pos):
	if Globals.equation_value(pos)>=0:
		circ_line_inst = circ_line_white.instance()
		circ_line_inst.set_position(pos)
		add_child(circ_line_inst)
	else:
		circ_line_inst = circ_line.instance()
		circ_line_inst.set_position(pos)
		add_child(circ_line_inst)
		
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			pressed = true
			prev_pos = get_global_mouse_position()
		else:
			pressed = false
	if event is InputEventMouseMotion:
		if pressed:
			draw(get_global_mouse_position())
			prev_pos = get_global_mouse_position()

func remove():
	var parent = get_parent()
	parent.remove_child(self)

