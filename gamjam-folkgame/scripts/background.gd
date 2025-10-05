extends Node3D

var trees = preload("res://scenes/trees.tscn")
var offset = 2.5
var pictureReady = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while  pictureReady < 30:
		multInst()
		pictureReady = pictureReady + 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func inst(pos):
	var instance = trees.instantiate()
	instance.manyKuusk = true
	instance.position = pos
	add_child(instance)
	offset = offset + 2.5

func multInst():
	inst(Vector3(offset,0,0))
	inst(Vector3(offset,0,1))
	inst(Vector3(offset,0,-1))
	inst(Vector3(offset,0,0))
