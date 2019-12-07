extends KinematicBody2D

export var speed = 1
var  can_jump

# Called when the node enters the scene tree for the first time.
func _ready():
	can_jump = true

func _process(delta):
	if Input.action_is_pressed('jump') && can_jump:
		jump()

func jump():
	pass