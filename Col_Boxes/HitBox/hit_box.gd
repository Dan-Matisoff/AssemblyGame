class_name hitBox extends Area2D

signal Taken(cName : String)
@export var comName : String = "mov"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func GetTaken() -> void:
	print("Command Block Name: ", comName)
	Taken.emit(comName)
	pass
