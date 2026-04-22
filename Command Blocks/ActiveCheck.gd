class_name ActiveCheck extends Node2D

#signal Regist(a:Area2D)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$DestinationR.area_entered.connect(RegisterCheck)
	#$SourceR.area_entered.connect(RegisterCheck)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func CheckAndPass() -> Array[Node2D]:
	var Registers : Array[Node2D]
	if $DestinationR.has_overlapping_areas():
		var DestOAreas = $DestinationR.get_overlapping_areas()
		for area in DestOAreas:
			if area.get_parent().get_script() == RegisterBlock:
				Registers.push_front(area.get_parent())
				break
	
	if $SourceR.has_overlapping_areas():
		var SourOAreas = $SourceR.get_overlapping_areas()
		for area in SourOAreas:
			if area.get_parent().get_script() == RegisterBlock:
				Registers.push_front(area.get_parent())
				break
	
	return Registers
	pass

#func RegisterCheck(a:Area2D) -> void:
#	if (a.get_parent() == RegisterBlock): #May not work
#		Regist.emit(a)
#	else :
#		Regist.emit(null)
