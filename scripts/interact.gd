extends RayCast3D

func _process(delta):
	var coll = self.get_collider()
	
	if self.is_colliding():
		if coll.is_in_group("cat"):
			$interactui.show()
			if Input.is_action_just_pressed("interact3d"):
				coll.interact()
	else:
		$interactui.hide()
