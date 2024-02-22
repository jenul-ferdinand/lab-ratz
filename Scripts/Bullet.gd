extends Area2D

# Speed of the bullet
const BULLET_SPEED = 300

# Creator of the bullet
@onready var creator : CharacterBody2D
@onready var bullet_damage : int = 10



# ENGINE FUNCTION: Called on entrance to scene
func _ready():
	area_entered.connect(on_area_entered)



# ENGINE FUNCTION: Called every frame
func _process(delta):
	# Set the direction of the bullet always to be rotated from the right
	var direction = Vector2.RIGHT.rotated(rotation)
	
	# Move the bullet 
	position += direction * BULLET_SPEED * delta



# FUNCTION: When the bullet enters an Area2D
func on_area_entered(area):

	# Hitting enemy
	if creator.is_in_group('player'):
		# Check if the area we entered is a enemy hitbox
		if area.is_in_group('enemy_hitbox'):
			# The enemy who is the parent of the area we entered
			var enemy = area.get_parent()

			# Make the enemy we hit take damage
			enemy.take_damage(bullet_damage)

			# Remove the bullet
			queue_free()
	
	# TODO: Hitting player
	if creator.is_in_group('enemy'):
		pass