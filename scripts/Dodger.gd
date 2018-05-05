extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const SPEED = 200

var mMovement = Vector2(0,0)


func _ready():
	
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		mMovement.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		mMovement.y = SPEED
	elif Input.is_action_pressed("ui_left"):
		mMovement.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		mMovement.x = SPEED
	else:
		mMovement = Vector2(0, 0)
	
	move_and_collide(mMovement, FLOOR)
	
	pass
