extends CharacterBody2D

var speed = 300

## the most mega barebones boilerplate character movement ever
func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("left","right","up","down") * speed
	move_and_slide()
