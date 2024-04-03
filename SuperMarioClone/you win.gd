extends CanvasLayer

@onready var you_win_label = $YouWinLabel

func _ready():
	you_win_label.visible = false  # Initially hidden
	# Connect the signal to the method

func _on_Player_player_win():
	you_win_label.visible = true
	# You can add additional actions here, such as playing a sound or showing animations
