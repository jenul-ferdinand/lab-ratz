extends Area2D

# Define a signal to be emitted when the Item is picked up
signal picked_up



# This function is called when the node enters the scene
func _ready():
	pass



# This function is called every frame
func _process(_delta):
	pass



# Another physics body enters the area of the PickupComponent
func _on_body_entered(body):
	
	# Check if the entering body is in the "player" group
	if body.is_in_group("player"):
		
		# Call the _on_item_picked_up function, passing the player as argument
		_on_item_picked_up(body)
		
		# Remove the Item parent
		get_parent().queue_free()



# Item is picked up by the player
func _on_item_picked_up(player):
	print("Picked up item by player:", player)
	
	if get_parent().name == "Medkit":
		print("Medkit")
	if get_parent().name == "Armour":
		print("Armour")
	if get_parent().name == "Ammobox":
		print("Ammobox")
