extends CharacterBody2D

var speed = 250

## the most mega barebones boilerplate character movement ever
func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed
	move_and_slide()
