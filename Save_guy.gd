class_name SaveGuy extends RigidBody2D

var moveFlag : bool = false
var tile_size = 32
var moving : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$"../BlueFloorButton".ButtonPressed.connect(buttonPressed)
	$"../BlueFloorButton".ButtonPressed.connect(buttonPressed)
	print(get_children())
	$GameOverCol.GameOver.connect(GameOver)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var direction : Vector2 = Vector2.ZERO
	if moveFlag and !moving :
		#$Area2D.monitoring = false
		moving = true
		var tween = create_tween()
		tween.tween_property(self,"position", position + Vector2.DOWN*tile_size,0.5)
		#tween.tween_callback(move_false)
	#else:
	#	moveFlag = Input.is_key_label_pressed(KEY_Z) == true
	#print("moveDirection", direction)
	
	pass

func move_false() -> void:
	$GameOverCol.LifeCheck()
	$WinCol.LifeCheck()
	moving = false

func buttonPressed() -> void:
	#print("ButtonPressed Emit Successful")
	moveFlag = true
	pass

func GameOver():
	moveFlag = false
	for i in 16:
		$Sprite2D.rotate(PI/4)
		await get_tree().create_timer(0.1).timeout
	visible = false
	pass
