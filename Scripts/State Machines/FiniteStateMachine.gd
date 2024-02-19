class_name FiniteStateMachine
extends Node

# Properties
@export var state: State



# FUNCTION: Called when the node enters the scene
func _ready():
	# Change the state to the predefined one set in editor
	change_state(state)



# FUNCTION: Called when we want to change states
func change_state(new_state: State):
	if state is State:
		state._exit_state()
	new_state._enter_state()
	state = new_state
