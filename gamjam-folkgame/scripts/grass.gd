extends Node3D

var grass = 0

#var plants_dict = {kuusk: false,  manyKuusk: false, manyLeaf: false}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GrassSprite1.hide()
	$GrassSprite2.hide()
	$GrassSprite3.hide()
	$GrassSprite4.hide()
	if grass == 1:
		$GrassSprite1.show()
	elif grass == 2:
		$GrassSprite2.show()
	elif grass == 3:
		$GrassSprite3.show()
	elif grass == 4:
		$GrassSprite4.show()
	pass # Replace with function body.
