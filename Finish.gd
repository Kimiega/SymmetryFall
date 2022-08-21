extends Area2D
var catched = false
onready var screen_size = get_viewport().size
var rng = RandomNumberGenerator.new()
var pos = Vector2()
func _ready():
	rng.randomize()
	if Globals.finish_point == null:
		new_finish()
	pos = Globals.finish_point
	set_position(pos)
	pass

func _on_Finish_body_entered(body):
	if body.get_filename()=="res://Ball_black.tscn" && !catched:
		print("finish")
		Globals.start = true
		catched = true
		
func remove():
	var parent = get_parent()
	parent.remove_child(self)

func new_finish():
	pos.x = rng.randf_range(30,screen_size.x-30)
	pos.y = rng.randf_range(screen_size.y*0.7,screen_size.y*0.95)
	#pos.x = 512
	#pos.y = 0
	Globals.finish_point = pos

