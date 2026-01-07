extends State

## extends enter function and sets alpha value
func enter():
	super.enter()
	owner.alpha = 1.3
	owner.bullet_type = 0
	speed.start()

## transitions to other nodes in the FSM
func transition():
	if can_transition:
		get_parent().change_state("4LeafPattern") 
