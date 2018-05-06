extends Node2D

const WINDOW = Vector2(1024, 600)
export (PackedScene) var enemy
var score


func _process(delta):
	if_quit()

func if_quit():
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()

func game_over():
	$ScoreTimer.stop()
	$EnemyTimer.stop()

func new_game():
	score = 0
	$EnemyTimer.start()
	$ScoreTimer.stop()
	
func _on_EnemyTimer_timeout():
	var e = enemy.instance()
	$Enemies.add_child(e)
	# var sign = (randi() % 2) == 0) ? 
	var spawn_point = Vector2(randi() % WINDOW.x)
	e.position = Vector2(spawn_point)
	print(spawn_point)
	e.set_linear_velocity(Vector2(0,100))

func _on_StartTimer_timeout():
	new_game()
	pass # replace with function body
