extends KinematicBody2D

export var speed = 1
export var jump_speed = 50

var velocity = Vector2()
const GRAVITY = 200
var air_time = 1
var  can_jump

# Called when the node enters the scene tree for the first time.
func _ready():
	can_jump = true

func _process(delta):
	if Input.is_action_pressed("jump") && can_jump:
		jump()

func jump():
	$AnimatedSprite.animation = "backjump"
	can_jump = false
	velocity.y = jump_speed * -1
	
func _physics_process(delta):
	var x_vel = velocity.x
	velocity.y += delta * GRAVITY * air_time
	air_time += 0.07
	var motion = velocity * delta
	# Should find something that's not move_and_collide so that I can move through 
	# platforms
	# There may be something like this in the book
	var collision = move_and_collide(motion)
	if collision:
		if velocity.y > 0:
			velocity.y = 0
			velocity.x = x_vel
			air_time = 1
			$AnimatedSprite.animation = "run"
			can_jump = true