class_name MovBlock extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HitBox.Taken.connect(getTaken)
	$"../../../BlueFloorButton".ButtonPressed.connect(CheckAction)
	pass # Replace with function body.


func getTaken( _cName: String) -> void:
	queue_free()
	pass

func CheckAction() -> Array[Node2D]:
	var Areas = $ActiveCheck.CheckAndPass()
	return Areas
	pass

func DoAction(source : Area2D, destination : Area2D):
	var sAreas = source.get_overlapping_areas()
	var dAreas = destination.get_overlapping_areas()
	if sAreas.size() == 1:
		if !dAreas.is_empty():
			for a in dAreas:
				a.queue_free()
		sAreas[0].get_parent().global_position = destination.global_position
	
	pass
	
