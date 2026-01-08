extends Node2D
class_name State ## class definition

## creates these variables when reffered node is ready as to not call a function on a non-existent item
@onready var debug = owner.find_child("debug") 
@onready var player = owner.get_parent().find_child("player")
@onready var speed = owner.find_child("speed")
@onready var duration = owner.find_child("duration")

var can_transition : bool = false ## creates a flag variable

## function that connects the duration timeout signal to this function when ready
func _ready():
	set_physics_process(false)
	duration.timeout.connect(_on_duration_timeout)	

## set transition flag to true when duration times out
func _on_duration_timeout():
	can_transition = true

## when entering transition, start the physics process again and reset the flag variable to close the loop and start timer again
func enter():
	set_physics_process(true)
	can_transition = false
	duration.start()

## when exiting, disable physics process
func exit():
	set_physics_process(false)

## debugging
func transition():
	pass

## changes label
func _physics_process(_delta):
	transition()
	debug.text = name
