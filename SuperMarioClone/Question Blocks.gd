extends TileMap

const COIN_GID = 10  # Assuming the coin tile has GID 10
const COIN_SCORE = 1  # Score/Coins to give when collected

func _ready():
	pass  # This script assumes you've set up the tilemap with question blocks and coin tiles

func _on_QuestionBlock_body_entered(body):
	if body.is_in_group("Player"):
		var world_pos = body.global_position
		var map_pos = world_to_map(world_pos)
		var tile_pos = map_to_world(map_pos)
		var tile_gid = get_cellv(map_pos)
		
		if tile_gid == COIN_GID:
			collect_coin(map_pos)
			set_cellv(map_pos, 0)  # Remove the coin tile

func collect_coin(cell_pos):
	# Add logic here to increase the player's coin count or score
	# For now, let's just print a message
	print("Coin Collected!")
