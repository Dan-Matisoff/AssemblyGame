class_name pointer extends Node2D

var moveFlag = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../BlueFloorButton".ButtonPressed.connect(RunBlocks)
	$"../SaveGuy".get_node("GameOverCol").GameOver.connect(gOver)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func RunBlocks():
	print("RunBlocks!!!!!!!!!!!!!!!!!!", position.y)
	while position.y < 510 and moveFlag:
		position.y += 32
		await get_tree().create_timer(1).timeout
		if $Command.get_overlapping_areas().size() == 1:
			var cOver = $Command.get_overlapping_areas()
			if cOver[0] is hitBox and cOver[0].get_parent().find_child("ActiveCheck"):
				var commParent = cOver[0].get_parent() 
				var Areas = commParent.CheckAction()
				if Areas.size() == 2:
					var returnAreas : Array[Area2D]= []
					for a in Areas:
						if a.name.substr(0,9) == $Registers/RegisterA.name:
							returnAreas.push_back($Registers/RegisterA)
						elif a.name.substr(0,9) == $Registers/RegisterB.name:
							returnAreas.push_back($Registers/RegisterB)
						elif a.name.substr(0,9) == $Registers/RegisterC.name:
							returnAreas.push_back($Registers/RegisterC)
						elif a.name.substr(0,9) == $Registers/RegisterD.name:
							returnAreas.push_back($Registers/RegisterD)
						elif a.name.substr(0,9) == $Registers/RegisterE.name:
							returnAreas.push_back($Registers/RegisterE)
						elif a.name.substr(0,9) == $Registers/RegisterF.name:
							returnAreas.push_back($Registers/RegisterF)
						elif a.name.substr(0,9) == $Registers/RegisterG.name:
							returnAreas.push_back($Registers/RegisterG)
					commParent.DoAction(returnAreas[0], returnAreas[1])
		await get_tree().create_timer(1).timeout
		if $"../SaveGuy" != null: 
			$"../SaveGuy".move_false()
	pass

func gOver() -> void:
	moveFlag = false
