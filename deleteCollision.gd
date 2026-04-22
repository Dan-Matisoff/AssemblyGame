class_name DeleteCollision extends Area2D

signal GameOver()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func LifeCheck():
	print(get_overlapping_bodies())
	if get_overlapping_bodies() != []:
		print("Overlapping Bodies Got!")
		for i in get_overlapping_bodies():
			print(i)
		GameOver.emit()
	pass
