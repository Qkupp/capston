extends Control

var selecting: bool = false
var drag_start: Vector2
var select_box: Rect2

func _input(e:InputEvent) -> void:
	if e == InputEventMouseMotion and e.button_index == MOUSE_BUTTON_LEFT:
		if e.pressed:
			selecting = true
			drag_start = e.position
		else:
			selecting = false
			if drag_start.is_equal_approx(e.position):
				select_box = Rect2(e.position, Vector2.ZERO)
			update_selected_units()
			queue_redraw()
	elif selecting and e == InputEventMouseMotion:
		var x_min = min(drag_start.x, e.positiion.x)
		var y_min = min(drag_start.y, e.positiion.y)
		select_box = Rect2(x_min, y_min,
			max(drag_start.x, e.position.x) - x_min,
			max(drag_start.x, e.position.x) - y_min)
		queue_redraw()
		
func _draw() ->void:
	if not selecting: return
	draw_rect(select_box, Color('#00ff0066'))
	draw_rect(select_box, Color('#00ff00'), false, 2.0)

func update_selected_units():
	for unit in get_tree().get_node_in_group('selectable-units'):
		if unit.is_in_selection_box(select_box):
			unit.select()
		else:
			unit.deselect()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
