# Gun (StaticBody2D)
extends StaticBody2D



# Determines if the gun can shoot
var can_shoot : bool = true
# Delay between shooting
var shoot_delay : float = 0.13
# Shooting delay timer
var timer : Timer
# Applying recoil
var apply_recoil = false
# Define knockback vector
var knockback_vector; 



# ENGINE FUNCTION: Called when the node enters the scene
func _ready():
	# Create a new time
	timer = Timer.new()

	# Set the timer to one shot
	timer.set_one_shot(true)

	# Set the wait time of the timer
	timer.set_wait_time(shoot_delay)

	# Connect the timer's timeout to our on_timeout function
	timer.timeout.connect(on_timeout)

	# Add the timer as a child of this node
	add_child(timer)



# ENGINE FUNCTION: Called every frame
func _process(_delta):

	# Rotating gun based on mouse position
	var mouse_position : Vector2 = get_local_mouse_position()
	var angle_degrees : float = rad_to_deg(atan2(mouse_position.y - position.y, mouse_position.x - position.x))
	$Sprite.rotation_degrees = angle_degrees
	
	# Flipping gun if mouse is on left or right of origin
	$Sprite.scale.y = -1 if mouse_position.x < position.y else 1
	
	# Flipping the shooting point based on gun
	%ShootingPoint.position.y = +2 if $Sprite.flip_v else -2
		
	# Handle shooting input 
	if Input.is_action_pressed("shoot") && can_shoot:

		# Call the shoot function 
		shoot()

		# Disable shooting until timer has timed out
		can_shoot = false
		
		# Recoil
		apply_recoil = true
		
		# Set knockback vector for recoil
		knockback_vector = (global_position - get_global_mouse_position()) * 0.1

		# Start the shoot delay timer
		timer.start()
	
	# Apply recoil
	if apply_recoil:
		# Interpolate knockback vector
		knockback_vector = lerp(knockback_vector, Vector2.ZERO, 0.1)
		
		# Set position to knockback vector
		position = knockback_vector



# FUNCTION: When the timer times out
func on_timeout():
	# We can shoot again
	can_shoot = true
	
	# No recoil
	apply_recoil = false
	
	# Reset gun position to original position
	position = Vector2.ZERO



# FUNCTION: Shooting bullets
func shoot():
	
	# Preload the bullet scene
	const BULLET = preload("res://Scenes/Bullet.tscn")
	
	# Create an instance of the bullet scene
	var new_bullet = BULLET.instantiate()

	# Set the creator of the bullet as the holder of the gun
	new_bullet.creator = get_parent()
	
	# Set the global position as the ShootingPoint of the gun
	new_bullet.global_position = %ShootingPoint.global_position
	
	# Set the rotation
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	
	# Add the new Bullet as a child of the ShootingPoint
	%ShootingPoint.add_child(new_bullet)
