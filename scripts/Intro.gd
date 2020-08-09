extends Control


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_options_pressed():
	get_tree().change_scene("res://assets/Optionsmenu.tscn")


func _on_Button_controls_pressed():
	get_tree().change_scene("res://assets/Controls_and_about.tscn")
