extends Spatial

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 
	

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if $escape_menu.visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$escape_menu.hide()
		elif not $escape_menu.visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$escape_menu.show()
			

func _on_resumeButton_pressed():
	$escape_menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _on_menuButton_pressed():
	get_tree().change_scene("res://Intro.tscn")
