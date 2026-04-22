class_name WinCollision extends Area2D

signal GameWon()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func LifeCheck():
	if get_overlapping_bodies() != []:
		GameWon.emit()
	pass
