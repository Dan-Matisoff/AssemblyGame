extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for grid in $LevelMenu/VBoxContainer/HBoxContainer/ClipControl/GridBox.get_children():
		for box in grid.get_children():
			box.level_selected.connect(load_level)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_level(num : int) -> void:
	var level = load("res://Level"+str(num)+".tscn").instantiate()
	if level != null:
		$"..".add_child(level)
		#var levelHomeButton = level.find_child("HomeButton") as HomeButton
		#levelHomeButton.goHome.connect(go_home)
		#levelHomeButton.text = "NOTHING"
		level.leave.connect(go_home)
		print("Signal Con List " + str(get_signal_connection_list(level.leave.get_name())))
		visible = false

func go_home() -> void:
	print("Home has been Sent")
	#$"..".find_child(sname).queue_free()
	visible = true
