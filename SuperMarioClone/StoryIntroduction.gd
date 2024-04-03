extends CanvasLayer

func _ready():
	# Start the timer
	$Timer.wait_time = 5
	$Timer.start()

func _on_timer_timeout():
	# This function is called when the Timer runs out
	hide()  # Hide the introduction scene
