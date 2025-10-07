extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if not globalVariables.canPlayerMove or not globalVariables.canDialogStart:
			return
		elif $Fox.interactionPossible:
			if globalVariables.dialogueProgFox < 1:
				foxDialogOne()
			elif globalVariables.dialogueProgFox == 1 and globalVariables.dialogueProg > 4:
				foxDialogTwo()
			print("input")
		elif $Eva.interactionPossible:
			if globalVariables.dialogueProgEva < 1:
				evaDialogOne()
			elif globalVariables.dialogueProgEva == 1 and globalVariables.dialogueProg > 2:
				evaDialogTwo()
			print("input")
		pass

func foxDialogOne():
	globalVariables.canPlayerMove = false
	Dialogic.start("A1S1D1")
	globalVariables.dialogueProgFox += 1
	globalVariables.dialogueProg += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)
	if globalVariables.dialogueProg == 2:
			$DialogueTimer.start(60)

func evaDialogOne():
	globalVariables.canPlayerMove = false
	Dialogic.start("A1S1D2")
	globalVariables.dialogueProgEva += 1
	globalVariables.dialogueProg += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)
	if globalVariables.dialogueProg == 2:
			$DialogueTimer.start(60)

func end():
	Dialogic.timeline_ended.disconnect(end)
	globalVariables.canPlayerMove = true
	globalVariables.canDialogStart = true


func _on_dialogue_timer_timeout() -> void:
	globalVariables.canDialogStart = false
	Dialogic.start("A1S2")
	globalVariables.dialogueProg += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)
	pass # Replace with function body.

func evaDialogTwo():
	globalVariables.canPlayerMove = false
	Dialogic.start("A1S3D2")
	globalVariables.dialogueProgEva += 1
	globalVariables.dialogueProg += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)
func foxDialogTwo():
	globalVariables.canPlayerMove = false
	Dialogic.start("A1S4")
	globalVariables.dialogueProgFox += 1
	globalVariables.dialogueProg += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)
