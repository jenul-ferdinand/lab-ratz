extends CharacterBody2D

# Normal moving speed
var movespeed = 68;

func _ready():
	pass

func _physics_process(delta):
	# Declare motion vector
	var motion = Vector2()
	
	# Input checking and movement
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
		
	if motion.x < 0:
		$Sprite.flip_h = true;
	else:
		$Sprite.flip_h = false;
	
	# Normalise movement (same speed every direction)
	motion = motion.normalized()
	# Apply motion times movespeed to player velocity
	velocity = motion * movespeed
	# Allow for move and slide
	move_and_slide()
