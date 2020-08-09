extends InterpolatedCamera

var mouse_sensitivity = 1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x*mouse_sensitivity))
		rotate_x(deg2rad(-event.relative.y*mouse_sensitivity))
