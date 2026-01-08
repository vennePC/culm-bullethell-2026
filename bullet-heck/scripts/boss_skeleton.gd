extends CharacterBody2D

## these variables are equivalent to theta and alpha values; stores angles in radians
## these mathematical constructs are being used as neat patterns can be made through the fibbonaci sequence / golden ratio
var theta: float = 0.0
@export_range(0,2*PI) var alpha: float = 0.0

## export allows variable or property to be handled within the godot inspector
@export var bullet_node: PackedScene
var bullet_type: int = 0

## function that converts angles to vectors
func get_vector(angle):
	theta = angle + alpha ## updates theta with alpha
	return Vector2(cos(theta),sin(theta))
	
func shoot(angle):
	var bullet = bullet_node.instantiate() ## returns tree of nodes to use child nodes
	
	bullet.position = global_position
	bullet.direction = get_vector(angle)
	
	## sets bullets property
	bullet.set_property(bullet_type)
	
	get_tree().current_scene.call_deferred("add_child",bullet) ## gets the tree from current node, deffers calling function until the current "add_child" is complete

## connected from speed timer node, calls shoot function every timeout
func _on_speed_timeout() -> void:
	shoot(theta)
