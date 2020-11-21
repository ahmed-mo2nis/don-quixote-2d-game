extends Area2D

func _on_DeathLine_body_entered(body):
	if body is KinematicBody2D:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
