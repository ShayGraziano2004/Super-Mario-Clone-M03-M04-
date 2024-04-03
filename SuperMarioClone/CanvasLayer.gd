extends CanvasLayer

var time_left = 305  # Starting time (300 seconds)
var score = 0  # Starting score
var score_multiplier = 1  # Starting score multiplier

@onready var time_label = $TimeLabel

func _ready():
	update_hud()  # Initial update

func _process(delta):
	# Update time
	time_left -= delta
	if time_left <= 0:
		time_left = 0  # Ensure time does not go negative
		# Handle game over when time runs out
		# For now, let's just reload the scene
		get_tree().reload_current_scene()

	# Update score (for now, score is just the remaining time)
	score = int(time_left * score_multiplier)  # Apply the score multiplier

	# Update HUD
	update_hud()

func update_hud():
	time_label.text = "Time: " + str(int(time_left))
