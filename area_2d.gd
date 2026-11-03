extends Area2D
#
#signal selection_toggled(selection)
#
#@export var exclusive = true
#@export var selection_action = "select"
#
#var selected = false #setget set_selected
#
#func set_selected(selection):
	#if selection and not selected:
		#_make_exclusive()
		#add_to_group("selected")
		#Label.visible = true
	#elif selection and selected:
		#remove_from_group("selected")
		#Label.visible = true
	##else:
	##	remove_from_group("selected")
	#selected = selection
	#emit_signal("selection_toggled", selected)
#
#func _make_exclusive():
	#if not exclusive:
		#return
	#get_tree().call_group("selected", "set_selected", false)
#
#func _input_event(viewport, event, shape_idx):
	#if event.is_action_pressed(selection_action):
		#set_selected(not selected)
#
### Called when the node enters the scene tree for the first time.
##func _ready() -> void:
	##pass # Replace with function body.
##
##
### Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta: float) -> void:
	##pass
