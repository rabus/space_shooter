extends Area2D

var plBullet := preload("res://bullet/Bullet.tscn")

onready var animatedSprite := $AnimatedSprite

export var speed:float = 300
var velocity := Vector2(0, 0)

func _ready():
	pass

func _process(delta):
	if velocity.x < 0:
		animatedSprite.play("idle")
	elif velocity.x > 0:
		animatedSprite.play("idle")
	else:
		animatedSprite.play("idle")
	
func _physics_process(delta):
	# Set direction vector
	var directionVector := Vector2(0, 0)
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
	
	# Stay within viewport - need to change to account for sprite size
	var viewportRect := get_viewport_rect()
	position.x = clamp(position.x, viewportRect.position.x, viewportRect.end.x)
	position.y = clamp(position.y, viewportRect.position.y, viewportRect.end.y)
	
	if Input.is_action_pressed("shoot"):
		var bullet := plBullet.instance()
		bullet.position = position
		bullet.position.x += 26
		bullet.position.y += 3
		get_tree().current_scene.add_child(bullet)
