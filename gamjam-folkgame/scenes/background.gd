extends Node3D

var trees = preload("res://scenes/trees.tscn")
var offset = 2.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inst(Vector3(0,0,0))
	inst(Vector3(2.5,0,0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func inst(pos):
	var instance = trees.instantiate()
	instance.manyKuusk = true
	instance.position = pos
	add_child(instance)
