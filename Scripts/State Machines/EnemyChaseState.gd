class_name EnemyChaseState
extends State

@export var actor: Enemy
@export var animator: AnimatedSprite2D
@export var vision_cast: RayCast2D

signal lost_player

func _ready() -> void: 
	set_physics_process(false)
	
func _enter_state() -> void:
	set_physics_process(true)
	
	animator.play("running")
	
func _exit_state() -> void:
	set_physics_process(false)
	
func _physics_process(delta) -> void:
	# Flipping sprite based on sign of velocity x
	animator.scale.x = sign(actor.velocity.x)
	if animator.scale.x == 0.0: animator.scale.x = 1.0
	
	# Move towards the mouse
	var direction = Vector2.ZERO.direction_to(vision_cast.target_position)
	actor.velocity = actor.velocity.move_toward(direction * actor.max_speed, actor.acceleration * delta)
	actor.move_and_slide()
	
	# If we can't see the player, emit lost_player signal
	if vision_cast.is_colliding():
		lost_player.emit()
	
