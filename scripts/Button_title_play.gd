extends Button


func _ready():
	pass


func _on_Button_title_play_pressed():
	get_tree().change_scene("res://assets/Levels.tscn")
