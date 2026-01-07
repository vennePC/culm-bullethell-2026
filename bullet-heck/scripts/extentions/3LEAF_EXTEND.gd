extends State

## extends enter function and sets alpha value
func enter():
	super.enter()
	owner.alpha = 2
	owner.bullet_type = 2
	speed.start()

## transitions to other nodes in the FSM
func transition():
	if can_transition:
		get_parent().change_state("2LeafPattern") 
