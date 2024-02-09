extends StaticBody2D

func _ready():
	pass

func _process(delta):
	# Rotating gun based on mouse position
	var mouse_position : Vector2 = get_local_mouse_position()
	var angle_degrees : float = rad_to_deg(atan2(mouse_position.y - position.y, mouse_position.x - position.x))
	$Sprite.rotation_degrees = angle_degrees
	
	# Flipping gun if mouse is on left or right of origin
	if (mouse_position.x < position.x):
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false
	
