extends ParallaxBackground



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_base_offset.x -= 300 * delta  # Bewegt den Hintergrund horizontal.
