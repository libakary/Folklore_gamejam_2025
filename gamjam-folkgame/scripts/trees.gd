extends Node3D

@export var kuusk: bool
@export var manyKuusk: bool
@export var manyLeaf: bool

var plants_dict = {kuusk: false,  manyKuusk: false, manyLeaf: false}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$kuusk.hide()
	$manyKuusk.hide()
	$manyLeaf.hide()
	if kuusk:
		$kuusk.show()
	elif manyKuusk:
		$manyKuusk.show()
	elif manyLeaf:
		$manyLeaf.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass
