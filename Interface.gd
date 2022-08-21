extends Node2D


func _ready():
	$ProgressBar.max_value = Globals.limit
	$ProgressBar.value = Globals.limit
	$Line2D.add_point(Vector2(0,25))
	$Line2D.add_point(Vector2(get_viewport().size.x+100,25))
	pass

func _process(delta):
	$Line2D.set_point_position(1,Vector2(get_viewport().size.x+100,25))
	$ProgressBar.set_position(Vector2(0,0))
	$Node2D.set_position(Vector2(get_viewport().size.x-150,0))
	$ProgressBar.value = Globals.spend
	$StarsLabel.set_text("Stars: "+str(Globals.stars))
	$LevelLabel.set_text("Level: "+str(Globals.level))
	if $Node2D/TextureButton.pressed:
		Globals.restart = true
		if Globals.picked_up:
			Globals.stars-=1
			Globals.picked_up = false	
	if $Node2D/NextButton.pressed:
		Globals.start = true
		if Globals.picked_up:
			Globals.stars-=1
			Globals.picked_up = false

func remove():
	var parent = get_parent()
	parent.remove_child(self)
