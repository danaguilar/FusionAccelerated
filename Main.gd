extends Node2D

var speed
var screensize

func _ready():
	screensize = get_viewport().get_visible_rect().size
	$Platform.speed = $Player.speed

func _process(delta):
	speed = $Player.speed