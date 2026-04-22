extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(press)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func press() -> void:
	$"..".visible = false
	visible = false
	($"../..".get_node("SaveGuy") as SaveGuy).position = Vector2(400,48)
	($"../..".get_node("SaveGuy") as SaveGuy).visible = true
	($"../..".get_node("Player") as Player).position = Vector2(80,48)
	($"../..".get_node("Pointer") as pointer).position = Vector2(16,48)
	($"../..".get_node("BlueFloorButton") as BlueFloorButton).alreadyPressed = false
	($"../..".get_node("Pointer") as pointer).moveFlag = true
