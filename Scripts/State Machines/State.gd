# State
extends Node

# This is a base class for any derived classes for the state machine
class_name State

# Signal for when state is finished
signal state_finished



# BASE FUNCTION: for entering state
func _enter_state() -> void:
	pass



# BASE FUNCTION: for exiting state 
func _exit_state() -> void:
	pass
