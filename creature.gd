extends Node2D

const TILE_SIZE: Vector2 = Vector2(16, 16)
var amount_of_times_move = 0


var inputs = {
	"move_up" : Vector2.UP,
	"move_down" : Vector2.DOWN,
	"move_left" : Vector2.LEFT,
	"move_right" : Vector2.RIGHT,
}

func handle_input(event: InputEvent) -> void:
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(direction)

func move(dir):
	var vector_pos = inputs[dir]*TILE_SIZE
	position += vector_pos
	
func movement(dir):
	if(dir == 'up'):
		#position = position.y + TILE_SIZE
		position.y -= TILE_SIZE.y
	if(dir == 'down'):
		#position = position.y - TILE_SIZE
		position.y += TILE_SIZE.y
	if(dir == 'right'):
		#position = position.x + TILE_SIZE
		position.x += TILE_SIZE.x
	if(dir == 'left'):
		#position = position.x - TILE_SIZE
		position.x -= TILE_SIZE.x
	
func _process(delta: float) -> void:
	if(amount_of_times_move<10): #10 is just a number for testing
		movement('up')
		amount_of_times_move=amount_of_times_move+1
	#movement('right')
	#movement('down')
	#movement('left')
