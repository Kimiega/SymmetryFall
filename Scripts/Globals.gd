extends Node
var line = null
var maxx = 1920
var maxy = 1080
var a
var b
var c
var ball_point = null
var star_point = null
var finish_point = null
var stars = 0
var level = 1
var line_point1 = Vector2()
var line_point2 = Vector2()
var limit = 3000
var spend
var restart = false
var start = false
var picked_up = false

func _ready():
	spend = limit
	pass
	
func sym_coords(point):
	var r = Vector2()
	r.x = (b*(b*point.x-a*point.y)-a*c)/(a*a+b*b)
	r.y = (a*(-b*point.x+a*point.y)-b*c)/(a*a+b*b)
	r = (r-point)*2+point
	return r

func set_line(p1,p2):
	line_point1 = p1
	line_point2 = p2
	line = Line2D.new()
	line.add_point(p1)
	line.add_point(p2)
	a = line_point2.y-line_point1.y
	b = line_point1.x-line_point2.x
	c = line_point1.y*(line_point2.x-line_point1.x)-line_point1.x*(line_point2.y-line_point1.y)

func equation_value(v):
	return a*v.x+b*v.y+c
