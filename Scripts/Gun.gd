extends StaticBody2D

func _ready():
	pass

func _process(delta):
	# Rotating gun based on mouse position
	var mouse_position : Vector2 = get_local_mouse_position()
	var angle_degrees : float = rad_to_deg(atan2(mouse_position.y - position.y, mouse_position.x - position.x))
	$Sprite.rotation_degrees = angle_degrees
	
	# Flipping gun if mouse is on left or right of origin
	$Sprite.flip_v = true if mouse_position.x < position.x else false
	
	# Flipping the shooting point based on gun
	if $Sprite.flip_v == true:
		%ShootingPoint.position.y = +2
	else:
		%ShootingPoint.position.y = -2
		
	# Handle shooting input
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	# Preload the bullet scene
	const BULLET = preload("res://Scenes/Bullet.tscn")
	
	# Create an instance of the bullet scene
	var new_bullet = BULLET.instantiate()
	
	# Set the global position as the ShootingPoint of the gun
	new_bullet.global_position = %ShootingPoint.global_position
	
	# Set the rotation
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	
	# Add the new Bullet as a child of the ShootingPoint
	%ShootingPoint.add_child(new_bullet)
