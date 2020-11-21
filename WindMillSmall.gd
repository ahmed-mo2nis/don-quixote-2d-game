extends KinematicBody2D

onready var health = Health
onready var health_bar = $HealthBar

var windmill_status = 1

var velocity = Vector2()

func _ready():
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()

func _physics_process(delta):
	velocity.x -= 1
	velocity = move_and_slide(velocity)
	if $RayCast2D.is_colliding():
		hit()

func hit():
	windmill_status -= windmill_status
	if windmill_status > 0:
		$Sprite.play("Idle")
	else:
		$Sprite.play("Rubble")
	
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		health.current_health -= 1

	if health.current_health == 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		health.current_health = 10
