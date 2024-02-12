extends Area2D

const BULLET_SPEED = 300

func _process(delta):
	# Set the direction of the bullet always to be rotated from the right
	var direction = Vector2.RIGHT.rotated(rotation)
	
	
	# Move the bullet 
	position += direction * BULLET_SPEED * delta
	
