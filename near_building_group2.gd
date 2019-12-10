extends Node2D

export var starting_textures = 5
var texture_size = 493
var textures = ['res://assets/ENVIRONMENT/background/near-buildings-bg.png']

func _ready():
	var i = 0
	while i < starting_textures:
		create_sprite(0)
		i = i + 1

func _process(delta):
	for s in get_children():
		s.position.x -= (get_parent().speed)*delta
		if s.position.x < texture_size * -2:
			create_sprite(s.position.x)
			s.queue_free()
			
	
func create_sprite(offset):
	var s = Sprite.new()
	s.texture = load(textures[0])
	var x_pos =  texture_size * (get_children().size()-1) + offset
	s.position = Vector2(x_pos ,143)
	add_child(s)