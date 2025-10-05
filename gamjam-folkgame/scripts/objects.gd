extends Node3D

var trees = preload("res://scenes/trees.tscn")
var acorns = preload("res://scenes/acorns.tscn")
var grass = preload("res://scenes/grass.tscn")
var offsetX = 0
var offsetZ = 0
var offsetY = 5
var pictureReady = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while  pictureReady < 100:
		multInst()
		multGrass()
		pictureReady = pictureReady + 1
	while pictureReady < 1000:
		multGrass()
		pictureReady = pictureReady + 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func instTree(pos):
	var instance = trees.instantiate()
	instance.tree = randi_range(1,2)
	instance.position = pos
	add_child(instance)
	offsetChange()

func instAcorn(pos):
	var instance = acorns.instantiate()
	instance.position = pos
	add_child(instance)
	offsetChange()
	
func instGrass(pos):
	var instance = grass.instantiate()
	instance.grass = randi_range(1,4)
	instance.position = pos
	add_child(instance)
	offsetChange()

func multInst():
	instTree(Vector3(offsetX, offsetY,offsetZ))
	instAcorn(Vector3(offsetX, 0,offsetZ))
	instTree(Vector3(offsetX, offsetY,offsetZ))
	instAcorn(Vector3(offsetX, 0,offsetZ))
	instTree(Vector3(offsetX, offsetY,offsetZ))
	instAcorn(Vector3(offsetX, 0,offsetZ))
	instTree(Vector3(offsetX,offsetY,offsetZ))
func multGrass():
	instGrass(Vector3(offsetX, 0, offsetZ))
	instGrass(Vector3(offsetX, 0, offsetZ))
	instGrass(Vector3(offsetX, 0, offsetZ))
	instGrass(Vector3(offsetX, 0, offsetZ))
	instGrass(Vector3(offsetX, 0, offsetZ))
func offsetChange():
	offsetX = randf_range(-100,100)
	offsetZ = randf_range(-100,100)
