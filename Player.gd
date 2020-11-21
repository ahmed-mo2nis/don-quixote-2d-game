extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var max_speed = 200
export var gravity = 40
const acceleration = 50
export var jump_force = -1000

func _ready():
	pass

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + acceleration, max_speed)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - acceleration, -max_speed)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	
	elif Input.is_action_pressed("ui_accept"):
		$Sprite.play("Fight")
		if $RayCast2D.is_colliding():
			var player_two = AudioStreamPlayer.new()
			self.add_child(player_two)
			player_two.stream = load("res://Audio/Sounds/Game/sfx_sounds_fanfare.ogg")
			player_two.play()
		
	else:
		$Sprite.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_released("ui_up"):
			motion.y = jump_force
			var player = AudioStreamPlayer.new()
			self.add_child(player)
			player.stream = load("res://Audio/Sounds/Game/sfx_movement_jump.ogg")
			player.play()
		
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		
	motion = move_and_slide(motion, UP)

# Turn RayCast2D toward movement direction
	if motion != Vector2.ZERO:
		$RayCast2D.cast_to = motion.normalized() * 22
