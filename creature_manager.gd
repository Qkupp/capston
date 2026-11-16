extends Node2D

var collision_mask_creature = 1

var screen_size
var creature_being_dragged
var snapped_once

const TILE_SIZE: Vector2 = Vector2(16, 16)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#global_position = global_position.snapped(TILE_SIZE)
	#print(creature_being_dragged)
	if creature_being_dragged != null:
		snapped_once = false
		var mouse_pos = get_global_mouse_position()
		creature_being_dragged.position = Vector2(clamp(mouse_pos.x, 0, screen_size.x),
			clamp(mouse_pos.y, 0, screen_size.y))
	elif not snapped_once:
		#print("creature not being draged")
		global_position = global_position.snapped(TILE_SIZE) + TILE_SIZE/2.0
		#global_position = (global_position - TILE_SIZE/2.0).snapped(TILE_SIZE)
		snapped_once = true
 
func _input(event): #manges inputs effect on the creatures
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("left click")
			if creature_being_dragged == null:
				var creature = raycast_check_for_creature()
				print(creature)
				if creature:
					creature_being_dragged = creature
			else:
				#creature_being_dragged.position = snap_creature(Vector2, Vector2):
				creature_being_dragged = null
		else:
			print("left click released")
			#creature_being_dragged = null

func raycast_check_for_creature(): #keep creature on the screen
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = collision_mask_creature
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null
