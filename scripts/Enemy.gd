extends RigidBody2D

export (int) var MIN_SPEED # minimum speed range
export (int) var MAX_SPEED # maximum speed range

func _ready():
	pass

func _process(delta):
	pass

func _on_Visibility_screen_exited():
    queue_free()