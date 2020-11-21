extends Area2D

func _on_SilverHelmet_body_entered(body):
	if body is KinematicBody2D:
		queue_free()
