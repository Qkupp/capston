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

#_enter_tree().creatureManager:

func _on_button_button_down() -> void:
	print("spawn button has been pressed")
	spawn_creature()

#@export var node: Manger
#calling over parts of the code
@onready var node: Node = $"../creatureManager"
@onready var spawn: Area2D = $"../Spawn_piont"

func spawn_creature() -> void:
	var creature = load("res://creature.tscn")
	var instance = creature.instantiate()
	node.add_child(instance)
	instance.position = spawn.position

	
func _on_delete_button_down() -> void:
	print("delete button has been pressed")
	print(Global.selected)
	if Global.selected:
		delete_creature(Global.selected)
	
	
func delete_creature(creature) -> void:
	creature.queue_free()
