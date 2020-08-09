extends KinematicBody

export var scroll_speed = 200



func _ready():
	pass
	
func _input(event):
	var direction_value = get_parent().global_transform.origin - global_transform.origin
	if Input.is_mouse_button_pressed(4):
		if direction_value.length() > 2:
			move_and_slide(direction_value*scroll_speed*get_process_delta_time())
	elif Input.is_mouse_button_pressed(5):
		if direction_value.length() < 100:
			move_and_slide(-direction_value*scroll_speed*get_process_delta_time())
		
