class_name Enemy
extends CharacterBody2D

# Properties
@export var max_speed = 40.0
@export var acceleration = 70.0

@onready var target = get_tree().get_first_node_in_group("player")
@onready var ray_cast_2d = $RayCast2D
@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var enemy_wander_state = $FiniteStateMachine/EnemyWanderState as EnemyWanderState
@onready var enemy_chase_state = $FiniteStateMachine/EnemyChaseState as EnemyChaseState



# FUNCTION: Called when the node enters the scene
func _ready():
	# When the wander state finds the player, change to the chase state
	enemy_wander_state.found_player.connect(fsm.change_state.bind(enemy_chase_state))
	
	# When the chase state loses the player, change to the wander state
	enemy_chase_state.lost_player.connect(fsm.change_state.bind(enemy_wander_state))
	
	# Prevent the RayCast2D from colliding with our own CollisionShape2D
	ray_cast_2d.add_exception(get_parent().get_node("CollisionShape2D"))
	
	# NOTE: The reason why the raycast doesn't collide with the player's collision
	# 		Is because the players CollisionShape2D is not a Layer 2 collision.
	#		THE RAYCAST WILL ONLY COLLIDE WITH COLLISIONS IN LAYER 2



# FUNCTION: Called every frame
func _physics_process(_delta):
	if target != null:
		# Set the RayCast2D's target position as the target's global position
		ray_cast_2d.target_position = target.global_position - global_position
