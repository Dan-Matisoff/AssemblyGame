extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../SaveGuy".get_node("GameOverCol").GameOver.connect(gameOver)
	$"../SaveGuy".get_node("WinCol").GameWon.connect(gameWon)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gameOver() -> void:
	visible = true
	$Label.text = "GAME OVER!"
	await get_tree().create_timer(2).timeout
	$Button.visible = true
	$HomeButton.visible = true


func gameWon() -> void:
	visible = true
	$Label.text = "YOU WIN!"
	await get_tree().create_timer(2).timeout
	$Button.visible = true
	$HomeButton.visible = true
