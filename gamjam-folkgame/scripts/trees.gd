extends Node3D

@export var kuusk: bool
@export var manyKuusk: bool
@export var manyLeaf: bool

var tree = 0

#var plants_dict = {kuusk: false,  manyKuusk: false, manyLeaf: false}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$kuusk.hide()
	$tree.hide()
	$manyKuusk.hide()
	$manyLeaf.hide()
	if tree == 1:
		$kuusk.show()
	elif tree == 2:
		$tree.show()
	elif tree == 3:
		$manyKuusk.show()
	elif tree == 4:
		$manyLeaf.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass
