class_name Player extends CharacterBody2D


#var move_speed : float = 100.0
var place_flag : bool = true
var moving : bool = false
var tile_size = 32

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var direction : Vector2 = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	
	if (Input.is_key_label_pressed(KEY_Z)):
		match direction:
			Vector2.DOWN:
				$Collisions.rotation_degrees = 0.0
				$Collisions/GrabBox.monitoring = true
			Vector2.UP:
				$Collisions.rotation_degrees = 180.0
				$Collisions/GrabBox.monitoring = true
			Vector2.LEFT:
				$Collisions.rotation_degrees = 90.0
				$Collisions/GrabBox.monitoring = true
			Vector2.RIGHT:
				$Collisions.rotation_degrees = -90.0
				$Collisions/GrabBox.monitoring = true
			Vector2.ZERO:
				$Collisions/GrabBox.monitoring = false
	elif (Input.is_key_label_pressed(KEY_X)):
		match direction:
			Vector2.DOWN:
				$Collisions.rotation_degrees = 0.0
				if place_flag:
					$Collisions/GrabBox.PlaceBox()
					place_flag = false
			Vector2.UP:
				$Collisions.rotation_degrees = 180.0
				if place_flag:
					$Collisions/GrabBox.PlaceBox()
					place_flag = false
			Vector2.LEFT:
				$Collisions.rotation_degrees = 90.0
				if place_flag:
					$Collisions/GrabBox.PlaceBox()
					place_flag = false
			Vector2.RIGHT:
				$Collisions.rotation_degrees = -90.0
				if place_flag:
					$Collisions/GrabBox.PlaceBox()
					place_flag = false
			Vector2.ZERO:
				$Collisions/GrabBox.monitoring = false
				place_flag = true
	elif direction != Vector2.ZERO :
		place_flag = true
		$Collisions/GrabBox.monitoring = false
		$Collisions.rotation_degrees = 0.0
		var colDir = $Collisions/WallColl.getDirection(direction)
		move(direction, colDir)
	
	pass

func move(dir : Vector2, col : Area2D):
	if moving == false and !col.has_overlapping_bodies():
		moving = true
		var tween = create_tween()
		tween.tween_property(self,"position", position + dir*tile_size,0.25)
		tween.tween_callback(move_false)
	
func move_false() -> void:
	moving = false
