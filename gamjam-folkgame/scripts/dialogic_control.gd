extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func dialogStart():
	#get_tree().paused = true
	globalVariables.canPlayerMove = false
	Dialogic.start("helloWorld")
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)

func end():
	Dialogic.timeline_ended.disconnect(end)
	globalVariables.canPlayerMove = true
	#get_tree().paused = false
