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
	a.transform.origin = Vector2(350,352)
	
	var b = small_windmill.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector2(450,352)

	var c = small_windmill.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector2(550,352)

	var d = small_windmill.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector2(650,352)

	var e = small_windmill.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector2(750,352)
	
	var f = small_windmill.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector2(850,352)
	
	var g = small_windmill.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector2(950,352)
	
	var h = small_windmill.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector2(1050,352)
	
	var i = small_windmill.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector2(1150,352)
	
	var j = small_windmill.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector2(1250,352)

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
