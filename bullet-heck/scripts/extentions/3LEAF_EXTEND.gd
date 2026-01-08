extends State
@onready var bullet_delay = %speed

## extends enter function and sets alpha value
func enter():
	super.enter()
	owner.alpha = 2
	owner.bullet_type = 2
	bullet_delay.wait_time = 0.05
	speed.start()

## transitions to other nodes in the FSM
func transition():
	if can_transition:
		get_parent().change_state("2LeafPattern") 
