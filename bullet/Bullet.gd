extends Area2D

export var speed:float = 500
var lifespan:float = 40
var timer:float = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position.x += speed * delta
	
func _process(delta):
	if timer < lifespan:
		timer += 1
	else:
		queue_free()
