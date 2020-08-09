extends ColorRect

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Intro.tscn")
