extends Area2D

# Signal to be emitted when the Item is picked up
signal picked_up

# The audio stream player to play sound
@onready var audio_stream = $AudioStreamPlayer2D
# Item resource
@export var item : Item

# This function is called when the node enters the scene
func _ready():
	# Assign the Item's pickup sound to the AudioStreamPlayer2D
	audio_stream.stream = item.pickup_sound



# This function is called every frame
func _process(delta):
	# Wave effect
	position.y = Wave.wave_with_delta(position.y - 65, position.y + 65, 1, 0, delta)
	


# Another physics body enters the area of the PickupComponent
func _on_body_entered(body):
	
	# Check if the entering body is in the "player" group
	if body.is_in_group("player"):
		# Play pickup sound effect
		audio_stream.play()
		await audio_stream.finished
		
		# Apply the item effects
		item.apply_effects(body)
		
		# Remove the Item parent
		get_parent().queue_free()

