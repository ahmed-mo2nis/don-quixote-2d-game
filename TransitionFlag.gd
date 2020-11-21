extends Area2D

export(String, FILE, "*.tscn") var next_level

func _ready():
	pass

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(next_level)
		elif body.name == "PlayerWHorse":
			get_tree().change_scene(next_level)
