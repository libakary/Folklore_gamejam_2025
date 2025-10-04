extends Node3D

var interactionPossible = false

@onready var Cast: ShapeCast3D = $CharacterBody3D/ShapeCast3D
@onready var nameNPC: Label3D = $Name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nameNPC.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	playerHere()
	pass

func playerHere():
	if Cast.is_colliding():
		nameNPC.show()
		interactionPossible = true
	else:
		nameNPC.hide()
		interactionPossible = false
