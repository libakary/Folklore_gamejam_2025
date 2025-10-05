extends Node3D

var trees = preload("res://scenes/trees.tscn")
var offsetX = 0
var offsetZ = 0
var pictureReady = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while  pictureReady < 0:
		multInst()
		pictureReady = pictureReady + 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func instTree(pos):
	var instance = trees.instantiate()
	instance.kuusk = true
	instance.position = pos
	add_child(instance)
	offsetX = randf_range(-30,30)
	offsetZ = randf_range(-30,30)

func multInst():
	instTree(Vector3(offsetX, 0,offsetZ))
	instTree(Vector3(offsetX, 0,offsetZ))
	instTree(Vector3(offsetX, 0,offsetZ))
	instTree(Vector3(offsetX,0,offsetZ))
