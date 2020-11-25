extends Area2D

onready var shootingSound := $AudioStreamPlayer2D
onready var animateBullet := $AnimatedSprite

export var speed:float = 500
export var cooldown:float = 0.2

var lifespan:float = 60
var timer:float = 0

func _ready():
	shootingSound.play()
	animateBullet.play("default")

func _physics_process(delta):
	position.x += speed * delta
	
func _process(delta):
	if timer < lifespan:
		timer += 1
	else:
		queue_free()

func getCooldown():
	return cooldown

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
