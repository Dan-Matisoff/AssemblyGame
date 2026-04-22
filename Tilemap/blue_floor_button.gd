class_name BlueFloorButton extends Area2D

signal ButtonPressed()
var alreadyPressed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(AreaEntered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func AreaEntered(a:Area2D)-> void:
	#print("Blue Button Area Entered")
	if a.get_parent().get_parent() == $"../Player" and !alreadyPressed:
		alreadyPressed = true
		ButtonPressed.emit()
	pass
