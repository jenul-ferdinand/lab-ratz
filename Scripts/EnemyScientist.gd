class_name Enemy
extends CharacterBody2D

@export var max_speed = 40.0
@export var acceleration = 70.0

@onready var target = get_tree().get_first_node_in_group("player")
@onready var ray_cast_2d = $RayCast2D
@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var enemy_wander_state = $FiniteStateMachine/EnemyWanderState as EnemyWanderState
@onready var enemy_chase_state = $FiniteStateMachine/EnemyChaseState as EnemyChaseState

func _ready():
	# When the wander state finds the player, change to the chase state
	enemy_wander_state.found_player.connect(fsm.change_state.bind(enemy_chase_state))
	
	# When the chase state loses the player, change to the wander state
	enemy_chase_state.lost_player.connect(fsm.change_state.bind(enemy_wander_state))
	
	# Prevent the RayCast2D from colliding with our own CollisionShape2D
	ray_cast_2d.add_exception(get_parent().get_node("CollisionShape2D"))
	
func _physics_process(delta):
	var direction = target.global_position - global_position
	
	ray_cast_2d.target_position = direction;
