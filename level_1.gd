class_name Level1 extends Node2D

signal leave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	leave.connect($"../LevelSelect".go_home)
	print($"../LevelSelect".get_children())
	print(leave.get_connections())
	print(leave.is_connected($"../LevelSelect".go_home))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
