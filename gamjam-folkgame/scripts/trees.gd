extends Node3D

@export var kuusk: bool
@export var manyKuusk: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$kuusk.hide()
	
	if kuusk:
		$kuusk.show()
	elif manyKuusk:
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass
