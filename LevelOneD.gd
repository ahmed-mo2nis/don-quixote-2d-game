extends Node

var small_windmill = preload("res://Scenes/WindMillSmall.tscn")

onready var health = Health
onready var health_bar = $Player/HealthBar

onready var enemy_container = $Enemy

func _ready():
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()
	
	var a = small_windmill.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector2(350,192)
	
	var b = small_windmill.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector2(450,192)

	var c = small_windmill.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector2(550,192)
	
	var d = small_windmill.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector2(650,192)
	
	var e = small_windmill.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector2(750,192)

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

func _on_GoldenHelmet_body_entered(body):
	if body is KinematicBody2D:
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/sfx_coin_double6.ogg")
		player.play()
		health.current_health += 5
