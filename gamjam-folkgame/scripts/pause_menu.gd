extends Panel

var menu_pressed = false 

func _ready() -> void:
	hide()
	pass

func menuPressed():
	if not menu_pressed:
		show()
		get_tree().paused = true
		menu_pressed = true 
	elif menu_pressed:
		hide()
		get_tree().paused = false
		menu_pressed = false

func _on_menu_pressed() -> void:
	menuPressed()

func _on_resume_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_1_forest.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
