extends Node

onready var health = Health
onready var health_bar = $Player/HealthBar

func _ready():
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()

func _input(event):
	if Input.is_key_pressed(KEY_P):
		get_tree().paused = true
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/sfx_sounds_pause_in.ogg")
		player.play()
	if Input.is_key_pressed(KEY_C):
		get_tree().paused = false
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/sfx_sounds_pause_out.ogg")
		player.play()
