extends Area

signal CoinCollected

func _ready():
	pass
	
func _physics_process(delta):
	rotate_y(deg2rad(4))


func _on_coin_body_entered(body):
	if body.name == "heroball":
		$AudioStreamPlayer.stream = load("res://music/495643__robbeman__coin-1.wav")
		$AudioStreamPlayer.play()
		$Timer.start()
		emit_signal("CoinCollected")
		
		

func _on_Timer_timeout():
	queue_free()
