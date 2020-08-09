extends StaticBody

var random_wait_time

func _on_Level_ready():
	$Timer.start()	

func _on_Timer_timeout():
	$AnimationPlayer.play()	



