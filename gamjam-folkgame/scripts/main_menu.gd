extends CanvasLayer

#var time_elapsed: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var dict: Dictionary = SaveManager.load_game()
	#time_elapsed = dict["time_elapsed"]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	#get_tree().change_scene_to_file()
	pass

func _on_options_pressed() -> void:
	#get_tree().change_scene_to_file()
	pass

func _on_quit_pressed() -> void:
	#SaveManager.save_game({"time_elapsed": time_elapsed})
	get_tree().quit()
