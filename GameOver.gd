extends Control

onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(5)
	timer.start()
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Audio/Sounds/Game/sfx_sound_nagger.ogg")
	player.play()

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/GameOver2.tscn")
