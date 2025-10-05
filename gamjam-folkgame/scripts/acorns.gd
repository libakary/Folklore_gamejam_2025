extends Node3D

var interactionPossible = false
var acorns = 0
@onready var Cast: ShapeCast3D = $RigidBody3D/ShapeCast3D
@onready var acorn: Label3D = $RigidBody3D/Label3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	acorn.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	playerHere()
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if interactionPossible:
			
			animation_player.play("acornPickUp")
			acorns += 1
			print("acorn")
			pass
			
func playerHere():
	if Cast.is_colliding():
		acorn.show()
		interactionPossible = true
	else:
		acorn.hide()
		interactionPossible = false
