extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("wheeldown"):
			fov += 5 #Camera
		if Input.is_action_pressed("wheelup"):
			fov -= 5 #Camera
