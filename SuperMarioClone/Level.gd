extends Area2D

func _ready():
	pass

func _on_body_entered(body):
	if body.is_in_group("Player"):
		# Show the story scene when the player enters the area
		var story_scene = load("res://StoryIntroduction.tscn").instance()
		get_tree().root.add_child(story_scene)
