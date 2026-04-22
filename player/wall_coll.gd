extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func getDirection(iDir : Vector2) -> Area2D:
	match iDir:
		Vector2.DOWN:
			return $Down
		Vector2.UP:
			return $Up
		Vector2.LEFT:
			return $Left
		Vector2.RIGHT:
			return $Right
	return null
