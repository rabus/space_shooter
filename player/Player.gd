extends Area2D

var speed:float = 100
var velocity:Vector2 = Vector2(0, 0)

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
	
func _physics_process(delta):
	# Set direction vector
	var directionVector:Vector2 = Vector2(0, 0)
	# Reset velocity vector
	velocity.x = 0
	velocity.y = 0
	# Set horizontal movement
	if Input.is_action_pressed("move_left"):
		directionVector.x = -1
	elif Input.is_action_pressed("move_right"):
		directionVector.x = 1
	# Set vertical movement
	if Input.is_action_pressed("move_up"):
		directionVector.y = -1
	elif Input.is_action_pressed("move_down"):
		directionVector.y = 1
	
	# Set velocity vector
	velocity = directionVector.normalized() * speed
	# Apply vector to position
	position += velocity * delta
