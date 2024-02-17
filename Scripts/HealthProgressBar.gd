extends ProgressBar

# Reference to the player
@export var player : Player
# For storing the health temporarily before interpolating
var temp_value: float = 0



# FUNCTION: Called when the node enters the scene
func _ready():
	# Connect the health_changed signal to the update_health function
	player.health_changed.connect(update_health)
	
	# Call the update_health function
	update_health()



# FUNCTION: Update progress to player health value
func update_health():
	
	# Set the temp value to the player's health
	temp_value = player.hp



# FUNCTION: Called every frame
func _process(_delta):

	# Interpolate the value to the temp value
	if self.value < temp_value:
		self.value = ceil(lerp(float(self.value), temp_value, 0.1))
	elif self.value > temp_value:
		self.value = floor(lerp(float(self.value), temp_value, 0.1))



