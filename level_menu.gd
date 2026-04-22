extends MarginContainer

var num_grids = 1
var current_grid = 1
var grid_width = 428
var num_levels = 2

@onready var gridbox = $VBoxContainer/HBoxContainer/ClipControl/GridBox

func _ready():
	$VBoxContainer/HBoxContainer/BackButton.pressed.connect(_on_BackButton_pressed)
	$VBoxContainer/HBoxContainer/NextButton.pressed.connect(_on_NextButton_pressed)
	# Number all the level boxes and unlock them
	# Replace with your game's level/unlocks/etc.
	# You can also connect the "level_selected" signals here
	num_grids = gridbox.get_child_count()
	for grid in gridbox.get_children():
		for box in grid.get_children():
			var num = box.get_index() + 1 + 72 * grid.get_index()
			box.level_num = num
			if num <= num_levels:
				box.locked = false

func _on_BackButton_pressed():
	if current_grid > 1:
		current_grid -= 1
		gridbox.position.x += grid_width

func _on_NextButton_pressed():
	if current_grid < num_grids:
		current_grid += 1
		gridbox.position.x -= grid_width
