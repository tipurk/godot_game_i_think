extends Area2D


# Called when the node enters the scene tree for the first time.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("chat"):
		get_viewport().set_input_as_handled()
		
		if is_instance_valid(owner.nearest_actionable):
			owner.nearest_actionable.emit_signal("actioned")
