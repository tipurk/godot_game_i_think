extends Camera2D

@export var zoomfactor = 1
@export var zoomspeed = 20
@export var zoomstep = 0.3
@export var factorstep = 0.1

func _ready():
	pass
	
func _process(delta):
	zoom.x = lerp(zoom.x, zoomfactor * zoom.x, zoomspeed * delta)
	zoom.y = lerp(zoom.y, zoomfactor * zoom.y, zoomspeed * delta)
	
	zoom.x = clamp(zoom.x, 0.5, 2)
	zoom.y = clamp(zoom.y, 0.5, 2)
	
	if zoomfactor > 1:
		zoomfactor -= factorstep
	elif zoomfactor < 1:
		zoomfactor += factorstep
		
func _input(event):
	if event.is_action_pressed("wheeldown"):
		zoomfactor -= factorstep
	if event.is_action_pressed("wheelup"):
		zoomfactor += factorstep
