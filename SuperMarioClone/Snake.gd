extends Node2D

var score_multiplier = 1

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
		

func _on_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
		score_multiplier += 1  # Increase the score multiplier

func get_score(current_time: float) -> int:
	# Calculate the score based on current time and score multiplier
	return int(current_time * score_multiplier)
