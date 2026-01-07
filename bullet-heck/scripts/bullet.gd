extends Area2D

@export var texture_array : Array[Texture2D]

## sets variables for speed and direction of bullet
var speed = 100
var direction = Vector2.RIGHT
## variable for image bullet uses
var bullet_type: int = 0

## update position through physics process in every physics tick; delta is the time between physics ticks and seconds
func _physics_process(delta: float) -> void:
	## update position with direction and speed
	position += direction * speed * delta

## connected from VOSE2D, takes signal from when VOSE2D exits the screen
func _on_screen_exited() -> void:
	## deletes the bullet when offscreen
	queue_free()

## updates bullet type, texture is set in function
func set_property(type):
	bullet_type = type
	$Sprite2D.texture = texture_array[type]
