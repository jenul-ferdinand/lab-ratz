extends Node2D


# FUNCTION: Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# FUNCTION: Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()