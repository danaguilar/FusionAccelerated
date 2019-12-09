extends Node2D

export (PackedScene) var Piece
export (int) var min_length
export (int) var max_length

var left_walls
var right_walls
var background

var length

func _ready():
	randomize()
	length = randi()% (max_length-min_length) - 1 + min_length
	create_platform()

func create_platform():
	var p = Piece.instance()
	$platform_group.add_child(p)
	p.show_sprite("left")
	p.position = Vector2(0,408)
	
	var i = 1
	while i <= length:
		p = Piece.instance()
		$platform_group.add_child(p)
		p.show_sprite("middle")
		p.position = Vector2(16*i,408)
		i = i + 1
		
	p = Piece.instance()
	$platform_group.add_child(p)
	p.show_sprite("right")
	p.position = Vector2(16 * (length + 1),408)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
