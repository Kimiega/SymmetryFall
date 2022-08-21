extends RigidBody2D

onready var screen_size = get_viewport().size
#var gravity = 400
var vel = Vector2()
var rng = RandomNumberGenerator.new()
var pos = Vector2()
var flag = true
func _ready():
	rng.randomize()
	if Globals.ball_point == null:
		new_ball()
	pos = Globals.ball_point
	set_position(pos)
	set_sleeping(true)
func _physics_process(delta):
	pass
	#vel.y = gravity*delta
	#add_central_force(vel)
	
func _process(delta):
	if flag:
		set_sleeping(true)
		set_collision_mask(0)
		set_collision_layer(0)
		
		flag = false
	if Input.is_action_just_pressed("start"):
		set_sleeping(false)
		set_collision_mask(1)
		set_collision_layer(1)
	pass

func remove():
	var parent = get_parent()
	parent.remove_child(self)

func new_ball():
	pos.x = rng.randf_range(20,screen_size.x-20)
	pos.y = rng.randf_range(50,screen_size.y*0.25)
	#pos.x = 512
	#pos.y = 0
	Globals.ball_point = pos
