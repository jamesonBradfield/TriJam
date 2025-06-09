extends Node2D

@export var kittenScene: PackedScene
@onready var spawn_position = $KittenSpawn

var level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = get_node("/root/level")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position = get_viewport().get_global_mouse_position()
	look_at(mouse_position)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("launch_kitten"):
		launch_kitten()

func launch_kitten():
	var kitten = kittenScene.instantiate()
	kitten.position = spawn_position.global_position()
	kitten.velocity = Vector2(100,100) # update values to depend on mouse cursor position
	level.add_child(kitten)
