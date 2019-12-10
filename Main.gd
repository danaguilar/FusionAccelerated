extends Node2D

var speed
var screensize
var game_time

func _ready():
	game_time = 0
	screensize = get_viewport().get_visible_rect().size
	$HUD.update_timer(game_time)
	$GameTimer.start()


func _process(delta):
	speed = $Player.speed
	$Background.speed = speed/2
	$moving_buildings.position.x -= speed * delta


func _on_GameTimer_timeout():
	game_time += 1
	$HUD.update_timer(game_time)
	
