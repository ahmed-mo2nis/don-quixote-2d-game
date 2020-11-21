extends Node

var small_windmill = preload("res://Scenes/WindMillSmall.tscn")

onready var health = Health
onready var health_bar = $PlayerWHorse/HealthBar

onready var enemy_container = $Enemy

func _ready():
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()
	
	var a = small_windmill.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector2(400,128)
	
	var b = small_windmill.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector2(500,128)

	var c = small_windmill.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector2(600,128)

	var d = small_windmill.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector2(700,128)

	var e = small_windmill.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector2(800,128)

	var f = small_windmill.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector2(900,128)

	var g = small_windmill.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector2(1000,128)

	var h = small_windmill.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector2(1100,128)

	var i = small_windmill.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector2(1200,128)

	var j = small_windmill.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector2(1300,128)
	
	var k = small_windmill.instance()
	enemy_container.add_child(k)
	k.transform.origin = Vector2(1400,128)
	
	var l = small_windmill.instance()
	enemy_container.add_child(l)
	l.transform.origin = Vector2(1500,128)
	
	var m = small_windmill.instance()
	enemy_container.add_child(m)
	m.transform.origin = Vector2(1600,128)
	
	var n = small_windmill.instance()
	enemy_container.add_child(n)
	n.transform.origin = Vector2(1700,128)
	
	var o = small_windmill.instance()
	enemy_container.add_child(o)
	o.transform.origin = Vector2(1800,128)

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

func _on_Dulcinea_body_entered(body):
	if body is KinematicBody2D:
		get_tree().change_scene("res://Scenes/GameFinished.tscn")
