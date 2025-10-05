extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var player_protagonist_animated: AnimatedSprite3D = $PlayerProtagonistAnimated
@onready var player_protagonist_walking_sound = $AudioStreamPlayer2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if not globalVariables.canPlayerMove:
		return
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction.x > 0:
		player_protagonist_animated.flip_h = true
	elif direction.x < 0:
		player_protagonist_animated.flip_h = false
	
	if not direction:
		player_protagonist_animated.play("idle")
	else:
		player_protagonist_animated.play("walk")
		player_protagonist_walking_sound.play()
		
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
