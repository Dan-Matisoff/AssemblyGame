class_name RegisterBlock extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HitBox.Taken.connect(getTaken)
	pass # Replace with function body.


func getTaken( _cName: String) -> void:
	queue_free()
	pass

func CheckAction() -> void:
	
	pass


	
	
	
