extends Control

func _ready():
	Input.set_mouse_mode(0)
	
func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/LevelOneA.tscn")

func _on_HowToPlayButton_pressed():
	get_tree().change_scene("res://Scenes/HowToPlay.tscn")

func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")

func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")
