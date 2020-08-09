extends Label

var drivername
		
	
func _on_gles3_CheckBox_pressed():
	if $gles3/ColorRect/CheckBox.pressed == true:
		$gles2/ColorRect2/CheckBox.pressed = false
		OS.window_fullscreen = true
	else:
		$gles2/ColorRect2/CheckBox.pressed = true
		OS.window_fullscreen = false
		

func _on_gles2_CheckBox_pressed():
	if $gles2/ColorRect2/CheckBox.pressed == true:
		$gles3/ColorRect/CheckBox.pressed = false
		OS.window_fullscreen = false	
	else:
		$gles3/ColorRect/CheckBox.pressed = true
		OS.window_fullscreen = true
