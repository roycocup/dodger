extends KinematicBody2D

const UP = Vector2(0, -1)

var mMovement = Vector2(0,0)


func _ready():
	
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		mMovement.y = -100
	elif Input.is_action_pressed("ui_down"):
		mMovement.y = 100
	elif Input.is_action_pressed("ui_left"):
		mMovement.x = -100
	elif Input.is_action_pressed("ui_right"):
		mMovement.x = 100
	else:
		mMovement = Vector2(0, 0)
	
	move_and_slide(mMovement)
	
	pass
