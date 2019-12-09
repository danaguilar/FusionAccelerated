extends KinematicBody2D

export var speed = 1
export var jump_speed = 50

var velocity = Vector2()
const GRAVITY = 200
var  can_jump

# Called when the node enters the scene tree for the first time.
func _ready():
	can_jump = true

func _process(delta):
	if Input.is_action_pressed("jump") && can_jump:
		jump()

func jump():
	$AnimatedSprite.animation = "jump"
	velocity.y = jump_speed * -1
	
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	var motion = velocity * delta
	var collision = move_and_collide(motion)
	if collision:
		$AnimatedSprite.animation = "idle"