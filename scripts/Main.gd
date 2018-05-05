extends Node2D

##########################
# Class Member Variables #
##########################
const ENEMY = preload("res://scenes/Enemy.tscn")
const MAX_ONSCREEN_ENEMIES = 4

var score

func _ready():
	call_deferred("new_game")

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
	
func _on_StartTimer_timeout():
	pass # replace with function body

func _on_ScoreTimer_timeout():
	pass # replace with function body

func _on_EnemyTimer_timeout():
	var enemy = ENEMY.instance()
	$Enemies.add_child(enemy)
	var spawPos = $EnemySpawnPath.curve.interpolate(0, (randi() % 99+1) / 10)
	enemy.position = Vector2(spawPos)
	enemy.set_linear_velocity(Vector2(0,100))