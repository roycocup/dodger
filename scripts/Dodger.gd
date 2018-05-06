extends KinematicBody2D

const UP = Vector2(0, -1)

export var speed = 200
var vel = Vector2(500,500)

var screensize  # size of the game window


func _ready():
	position = vel
	screensize = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		vel.y = -speed
	elif Input.is_action_pressed("ui_down"):
		vel.y = speed
	elif Input.is_action_pressed("ui_left"):
		vel.x = -speed
	elif Input.is_action_pressed("ui_right"):
		vel.x = speed
	else: 
		vel = Vector2(0, 0)
		
	move_and_slide(vel, UP)

