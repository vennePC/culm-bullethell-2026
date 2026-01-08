extends State

## accesses collision shape as unique name to avoid having to update script every time the node path is changed
@onready var collision = %CollisionShape2D

## variable controlling collision
var player_entered : bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)

## connects body_entered signal from playerDetection node
func _on_player_detection_body_entered(_body: Node2D) -> void:
	player_entered = true

## transitions to other nodes in the FSM
func transition():
	if player_entered:
		get_parent().change_state("5LeafPattern") 
