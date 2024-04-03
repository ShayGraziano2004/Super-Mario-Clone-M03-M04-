extends StaticBody2D

func _on_Coin_body_entered(body):
	if body.is_in_group("Player"):
		# Player collected the coin
		queue_free()  # Remove the coin from the scene
