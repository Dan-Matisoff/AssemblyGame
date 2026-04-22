class_name HomeButton extends Button

signal goHome

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_press() -> void:
	$"../..".emit_signal("leave")
