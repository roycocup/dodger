extends Node2D

##########################
# Class Member Variables #
##########################
const ENEMY = preload("res://scenes/Enemy.tscn")
const DODGER = preload("res://scenes/Dodger.tscn")
const MAX_ONSCREEN_ENEMIES = 4

onready var player_layer = self.get_node("Player_Layer")
onready var enemies_layer = self.get_node("Enemies_Layer")

func if_quit():
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
	pass
	
func spawn_player():
	var dodger = DODGER.instance(true)
	player_layer.get_transform().x = 0
	player_layer.get_transform().y = 0
	player_layer.add_child(dodger)
	pass
	
func spawn_enemies():
    var children = enemies_layer.get_child_count()
    if children < 2:
        var to_spawn = MAX_ONSCREEN_ENEMIES-children
        for n in range(to_spawn):
            var enemy = ENEMY.instance(true)
            var posx = floor(rand_range(-45,46))
            var posy = floor(rand_range(-11,12))
            enemy.set_pos(Vector2(posx,posy))

            enemies_layer.add_child(enemy)
            pass
    pass

func _ready():
	randomize(true)
	set_process(true)
	pass

func _process(delta):
	if_quit()
	#spawn_player()
	#spawn_enemies()
	pass
	




