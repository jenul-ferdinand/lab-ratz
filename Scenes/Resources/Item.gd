extends Resource
class_name Item

# Properties
@export var icon: Texture2D
@export var name: String
@export var pickup_sound: AudioStream

# Additional properties
@export var health_increase: int = 0
@export var armour_increase: int = 0
@export var ammo_increase: int = 0

func apply_effects(player: CharacterBody2D):
	# player.increase_health(health_increase)
	# player.increase_armour(armour_increase)
	# player.increase_ammo(ammo_increase)
	pass
