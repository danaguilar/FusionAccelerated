extends Node2D

export (PackedScene) var Piece
export (int) var min_length
export (int) var max_length

var screensize
var x_offset
var length
var speed
var can_spawn_more
var delay

func _ready():
	randomize()
	speed = 100
	delay = 100
	screensize = get_viewport().get_visible_rect().size
	x_offset = screensize.x
	#length = randi()% (max_length-min_length) - 1 + min_length
	length = 5
	can_spawn_more = false
	create_platform()

func _process(delta):
	delay = delay - 1
	print(delay)
	var last_piece = true
	for p in $platform_group.get_children():
		if p.position.x > x_offset:
			last_piece = false
		p.position.x -= (speed)*delta
		if p.position.x < -50:
			p.queue_free()
	
	if delay < 0 && can_spawn_more:
		create_platform()
		can_spawn_more = false

	if last_piece:
		start_timer()

func create_platform():
	var p = Piece.instance()
	$platform_group.add_child(p)
	p.show_sprite("left")
	p.position = Vector2(x_offset,408)
	
	var i = 1
	while i <= length:
		p = Piece.instance()
		$platform_group.add_child(p)
		p.show_sprite("middle")
		p.position = Vector2(16*i + x_offset,408)
		i = i + 1
		
	p = Piece.instance()
	$platform_group.add_child(p)
	p.show_sprite("right")
	p.position = Vector2(16 * (length + 1) + x_offset,408)

func start_timer():
	if(delay < 0):
		delay = randi() % 100 + 25
		can_spawn_more = true
