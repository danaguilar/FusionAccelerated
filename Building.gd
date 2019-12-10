extends Node2D

export (PackedScene) var Piece
export (int) var min_length = 7
export (int) var max_length = 20

var left_walls
var right_walls
var background

var length
var height

onready var walls = $Walls

func _ready():
	randomize()
	length = randi()% (max_length-min_length) - 1 + min_length
	height = 20
	create_building()
	

func create_building():
	# Build wall at the 0 X column
	var next_build_cell = Vector2(0,0)
	var i = 0
	var left_wall_tile = walls.get_cellv(Vector2(0,0))
	var right_wall_tile = walls.get_cellv(Vector2(3,0))
	var background_cells = walls.get_cellv(Vector2(6,0))
	while i < height:
		walls.set_cellv(Vector2(0,i), left_wall_tile)
		i = i + 1
	
	i = 1
	while i < length - 1:
		var j = 0
		while j < height:
			walls.set_cellv(Vector2(i,j), background_cells)
			j = j + 1
		i = i + 1
		
	i = 0
	while i < height:
		walls.set_cellv(Vector2(length - 1,i), right_wall_tile)
		i = i + 1
	
	# Next draw platforms. Platforms should be 4 - 6 tiles away from each other
	# Makes sure there's a platform at the top that acts like a roof

	# Finally add some effects. Windows in the empty spaces along with pipes and things
	# Create animated sprites and add them hanging off of walls and platforms

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
