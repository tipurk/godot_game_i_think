extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact(pers:Pers):
	var data = GlobalData.get_instance()
	data.data = "interactble"
	get_tree().change_scene_to_file("res://scenes/tilemap.tscn")
