class_name EnemyWanderState
extends State

# Properties
@export var actor: Enemy
@export var animator: AnimatedSprite2D
@export var vision_cast: RayCast2D

# Signal for when actor finds the player
signal found_player



# FUNCTION: Called when node enters the scene
func _ready():
	set_physics_process(false)



# FUNCTION: Actor enters state
func _enter_state() -> void:
	set_physics_process(true)
	
	# Play running animation
	animator.play("running")
	
	# Set velocity to random vector direction
	if actor.velocity == Vector2.ZERO:
		actor.velocity = Vector2.RIGHT.rotated(randf_range(0, TAU)) * actor.max_speed



# FUNCTION: When the actor exits the state
func _exit_state() -> void: 
	set_physics_process(false)

	# Stop animating
	animator.stop()



# FUNCTION: Called every frame
func _physics_process(delta):
	# Flipping sprite based on sign of velocity x
	animator.scale.x = sign(actor.velocity.x)
	if animator.scale.x == 0.0: animator.scale.x = 1.0
	
	#actor.velocity = actor.velocity.move_toward(actor.velocity.normalized() * actor.max_speed, actor.acceleration * delta)
	
	# Bouncing off walls
	var collision = actor.move_and_collide(actor.velocity * delta)
	if collision:
		var bounce_velocity = actor.velocity.bounce(collision.get_normal())
		actor.velocity = bounce_velocity
	
	# If we see the player, emit found_player signal
	if not vision_cast.is_colliding():
		found_player.emit()
