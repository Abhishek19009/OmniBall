extends Label

var count = 0
const TOTAL_COUNT = 15

func _ready():
	text = str(count)

func _on_CoinCollected():
	count += 1
	_ready()
	if count == TOTAL_COUNT:
		$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://assets/youwin.tscn") 
