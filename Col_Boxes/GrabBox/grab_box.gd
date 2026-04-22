class_name GrabBox extends Area2D

var gotten : Array = Array()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect( AreaEntered )
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func getStack() -> Array:
	return gotten

func AreaEntered( a : Area2D) -> void:
	if a is hitBox:
		print("Taking...")
		gotten.push_front(a.get_parent().duplicate())
		var addtoUI = TextureRect.new()
		
		var atlasTexture = AtlasTexture.new()
		var aSprite2D := a.get_parent().get_node("Sprite2D") as Sprite2D
		atlasTexture.atlas = aSprite2D.get_texture()
		var spriteSize = Vector2(32, 32)
		var cFrameV = 0
		var cFrameH = 0
		for i in aSprite2D.frame:
			cFrameH+=1
			if cFrameH >= aSprite2D.hframes:
				cFrameH = 0
				cFrameV+=1
		atlasTexture.region = Rect2(Vector2(cFrameH*32, cFrameV*32), spriteSize)
		
		addtoUI.set_texture(atlasTexture)
		$"../../../HBoxContainer".add_child(addtoUI)
		$"../../../HBoxContainer".move_child(addtoUI,1)
		print("TakenList: ", gotten)
		a.GetTaken()
	pass

func PlaceBox() -> void:
	if gotten.is_empty() :
		pass
	else: 
		$"../../../HBoxContainer".get_children()[1].queue_free()
		print("PlaceList: ",gotten)
		var box := gotten.pop_front() as Node2D
		print(box)
		box.global_position = $CollisionShape2D.global_position
		if box.name.begins_with("R"):
			$"../../../Blocks/Registers".add_child(box)
		else:
			$"../../../Blocks/Commands".add_child(box)
	pass

func addStack(cN : String) -> void:
	print("Command Name in Grab: ", cN)
	pass
