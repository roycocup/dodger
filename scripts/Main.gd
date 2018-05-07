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

func spawn_enemy():
	var e = enemy.instance()
	var x = randi() % int(WINDOW.x)
	var spawn_point = Vector2(x , 0)
	e.position = spawn_point
	$Enemies.add_child(e)
	e.set_linear_velocity(Vector2(0,100))
	
func _on_EnemyTimer_timeout():
	spawn_enemy()

func _on_StartTimer_timeout():
	new_game()
