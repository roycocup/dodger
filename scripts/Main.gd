extends Node2D

const ENEMY = preload("res://scenes/Enemy.tscn")
const MAX_ONSCREEN_ENEMIES = 4
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
	
func _on_StartTimer_timeout():
	new_game()

func _on_ScoreTimer_timeout():
	pass # replace with function body

func _on_EnemyTimer_timeout():
	var enemy = ENEMY.instance()
	$Enemies.add_child(enemy)
	var num_points = $EnemySpawnPath.curve.get_point_count()
	var point = $EnemySpawnPath.curve.get_point_position(randi() % num_points + 1)
	print(point)
	enemy.position = Vector2(point)
	enemy.set_linear_velocity(Vector2(0,100))