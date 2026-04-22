class_name StackContainer extends HBoxContainer

var stored : Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_child_count() > 11:
		var removed = get_children()[get_child_count()-1]
		stored.push_front(removed.duplicate())
		removed.queue_free()
	elif get_child_count() < 11 and stored != []:
		var add = stored.pop_front()
		add_child(add)
	#var sLabel = $StackLabel.duplicate()
	#for child in get_children():
	#	remove_child(child)
	#add_child(sLabel)
	#for box in $"../Player".get_node("Collisions/GrabBox").getStack():
	#	add_child(box)
	pass
