extends Area2D

# Speed of the bullet
const BULLET_SPEED = 300



# FUNCTION: Similar to _physics_process(delta) this is called every frame but
#			it's frequency can vary depending on the frame rate
func _process(delta):
	# Set the direction of the bullet always to be rotated from the right
	var direction = Vector2.RIGHT.rotated(rotation)
	
	# Move the bullet 
	position += direction * BULLET_SPEED * delta
