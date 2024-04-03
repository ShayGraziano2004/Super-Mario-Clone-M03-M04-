extends CharacterBody2D

const SPEED = 10500
const JUMP_POWER = -45000
const ACC = 500
const FRICTION = 350
const GRAVITY = 1500
const MAX_JUMPS = 2

var current_jumps = 1
var can_move = true  # Added flag to control player movement

signal player_win

func _physics_process(delta):
	if can_move:
		var input_dir: Vector2 = input()

		if input_dir != Vector2.ZERO:
			accelerate(input_dir)
		else:
			add_friction()

		player_movement()
	
	# Applying gravity
	velocity.y += GRAVITY * delta

	jump()

func input() -> Vector2:
	var input_dir = Vector2.ZERO

	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir = input_dir.normalized()
	return input_dir

func accelerate(direction):
	velocity = velocity.move_toward(SPEED * direction, ACC)

func add_friction():
	if is_on_floor():
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

func player_movement():
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("ui_up"):
		if current_jumps < MAX_JUMPS:
			velocity.y = JUMP_POWER
			current_jumps += 1
	else:
		velocity.y += GRAVITY

	if is_on_floor():
		current_jumps = 1

func _on_Flag_area_entered(area):
	if area.is_in_group("Player"):
		can_move = false  # Disable player movement
		emit_signal("player_win")  # Signal for "You Win" HUD

		# Move player automatically
		velocity.x = SPEED

func _on_Flag_area_exited(area):
	if area.is_in_group("Player"):
		can_move = true  # Enable player movement when leaving flag area
