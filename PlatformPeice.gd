extends StaticBody2D

func _ready():
	$left_end.hide()
	$right_end.hide()
	$middle1.hide()
	$middle2.hide()
	
func show_sprite(type):
	match type:
		"left":
			$left_end.show()
		"right":
			$right_end.show()
		"middle":
			if (randi() % 10 < 3):
				$middle1.show()
			else:
				$middle2.show()