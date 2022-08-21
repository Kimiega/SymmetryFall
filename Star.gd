extends Area2D
var catched = false
var rng = RandomNumberGenerator.new()
onready var screen_size = get_viewport().size
var pos = Vector2()

func _ready():
	rng.randomize()
	if Globals.star_point == null:
		new_star()
	pos = Globals.star_point
	set_position(pos)
	pass


func _on_Star_body_entered(body):
	if body.get_filename()=="res://Ball_black.tscn" && !catched:
		$StarFilled.visible = false
		Globals.stars += 1
		catched = true
		Globals.picked_up = true
		
func remove():
	var parent = get_parent()
	parent.remove_child(self)

func new_star():
	pos.x = rng.randf_range(30,screen_size.x-30)
	pos.y = rng.randf_range(50+screen_size.y*0.25,screen_size.y-50)
	#pos.x = 512
	#pos.y = 0
	Globals.star_point = pos
	Globals.picked_up = false
