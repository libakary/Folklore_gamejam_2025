extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		
		if $Fox.interactionPossible:
			if globalVariables.dialogueProgFox < 1:
				foxDialogOne()
			print("input")
		elif $Eva.interactionPossible:
			if globalVariables.dialogueProgEva < 1:
				evaDialogOne()
			print("input")
		pass

func foxDialogOne():
	globalVariables.canPlayerMove = false
	Dialogic.start("A1S1D1")
	globalVariables.dialogueProgFox += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)

func evaDialogOne():
	globalVariables.canPlayerMove = false
	Dialogic.start("A1S1D2")
	globalVariables.dialogueProgEva += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)

func end():
	Dialogic.timeline_ended.disconnect(end)
	globalVariables.canPlayerMove = true
