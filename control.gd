extends Control

const TILE_SIZE: Vector2 = Vector2(16, 16)
var spawn_point = TILE_SIZE

const creature = preload("res://creature.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	print("button has been pressed")
	spawn_creature()

func spawn_creature() -> void:
	var creature = load("res://creature.tscn")
	var instance = creature.instantiate()
	add_child(instance)
	instance.position =  get_global_mouse_position() #Spawn_piont
	
	
