extends Node2D

## two variables to store states, are treated as the State class declared in state.gd
var current_state: State
var previous_state: State

## when ready, enters the first state
func _ready():
	current_state = get_child(0) as State
	previous_state = current_state
	current_state.enter()

func change_state(state):
	## if the state is the same as the previous state (as checked through the name), return nothing
	if state == previous_state.name:
		return
	
	## finds current state through child only checks State class items
	current_state = find_child(state) as State 
	current_state.enter()
	
	previous_state.exit()
	previous_state = current_state
