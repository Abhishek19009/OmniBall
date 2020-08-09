extends Button


func _ready():
	pass


func _on_gameover_play_again_button_pressed():
	get_tree().change_scene("res://Intro.tscn")
