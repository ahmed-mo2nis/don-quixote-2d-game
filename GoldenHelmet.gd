extends Area2D

func _on_GoldenHelmet_body_entered(body):
	if body is KinematicBody2D:
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/sfx_coin_double6.ogg")
		player.play()
		queue_free()
