extends Control

var isopen : bool = false

func open():
	visible = true
	isopen = true

func close():
	visible = false
	isopen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if isopen:
			close()
		else:
			open()
