extends CharacterBody2D
class_name Player

# Normal moving speed
var movespeed : float = 68.0
# Health points 
var hp : int = 50
var max_hp : int = 100
# Signal for when health is changed
signal health_changed

# FUNCTION: Called when the node enters the scene
func _ready():
	# Add to the player group
	self.add_to_group("player")



# FUNCTION: Called every frame
func _physics_process(_delta):
	# Declare motion vector
	var motion = Vector2()
	
	# Input and movement
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
		$Sprite.flip_h = true # Flip sprite horizontally
	if Input.is_action_pressed("right"):
		motion.x += 1
		$Sprite.flip_h = false # Un-flip sprite horizontally
	
	# Animation
	if motion != Vector2(0, 0):
		$Sprite.play("running")
	else:
		$Sprite.stop()
	
	# Normalise movement (same speed every direction)
	motion = motion.normalized()
	# Apply motion times movespeed to player velocity
	velocity = motion * movespeed
	# Allow for move and slide
	move_and_slide()



# FUNCTION: Increase player health points
func increase_health(amount: int):
	hp += amount

	if (hp >= max_hp):
		hp = max_hp

	print(amount)

	health_changed.emit()