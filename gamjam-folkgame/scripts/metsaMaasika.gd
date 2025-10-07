extends Node3D

@onready var strawberry: Label3D = $Label3D
@onready var Cast: ShapeCast3D = $ShapeCast3D

var interactionPossible = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	strawberry.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	playerHere()
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if interactionPossible:
			if globalVariables.dialogueProg == 3 and globalVariables.canDialogStart:
				strawberryQuest()
			print("strawberry")
			pass
			
func playerHere():
	if Cast.is_colliding():
		strawberry.show()
		interactionPossible = true
	else:
		strawberry.hide()
		interactionPossible = false

func strawberryQuest():
	globalVariables.canPlayerMove = false
	Dialogic.start("A1S3D1")
	globalVariables.dialogueProg += 1
	get_viewport().set_input_as_handled()
	Dialogic.timeline_ended.connect(end)

func end():
	Dialogic.timeline_ended.disconnect(end)
	globalVariables.canPlayerMove = true
