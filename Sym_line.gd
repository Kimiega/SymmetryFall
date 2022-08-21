extends Node2D
onready var screen_size = get_viewport().size
onready var point_center = Vector2(screen_size.x/2,screen_size.y/2)
var rng = RandomNumberGenerator.new()
var point1 = Vector2()
var point2 = Vector2()
func _ready():
	if Globals.line == null:
		new_sym_line()
	print(Globals.line.get_points())
	var line = Line2D.new()
	line.add_point(Globals.line.get_points()[0])
	line.add_point(Globals.line.get_points()[1])
	Globals.line = line
	add_child(Globals.line)
	update()
	
func _draw():
	var colour = PoolColorArray()
	var points = get_draw_points()
	colour = [Color("#000000")]
	print(points)
	draw_polygon(points,colour)
func get_draw_points():
	var points = PoolVector2Array()
	var angle1 = Vector2(0,0)
	var angle2 = Vector2(screen_size.x,0)
	var angle3 = Vector2(screen_size.x,screen_size.y)
	var angle4 = Vector2(0,screen_size.y)
	if Globals.equation_value(angle1)>=0 && Globals.equation_value(angle2)>=0:
		points = [Globals.line_point1, angle1, angle2,Globals.line_point2]
	if Globals.equation_value(angle2)>=0 && Globals.equation_value(angle3)>=0:
		points = [Globals.line_point1,angle2, angle3, Globals.line_point2]
	if Globals.equation_value(angle3)>=0 && Globals.equation_value(angle4)>=0:
		points = [Globals.line_point1, Globals.line_point2, angle3,angle4]
	if Globals.equation_value(angle4)>=0 && Globals.equation_value(angle1)>=0:
		points = [Globals.line_point1, Globals.line_point2, angle4,angle1]
	return points
func remove():
	var parent = get_parent()
	parent.remove_child(self)

func new_sym_line():
	rng.randomize()
	if rng.randi_range(0,1):
		point1 = Vector2(rng.randi_range(0,screen_size.x),0)
	else:
		point1 = Vector2(0,rng.randi_range(0,screen_size.y))
	point2 = (point_center - point1)*2+point1
	Globals.set_line(point1,point2)
