extends RigidBody3D


@export_dir var scene_change : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	var ls = Global.loadingScreen
	Global.loadingScreen.change_scene_to = scene_change
	get_tree().root.add_child(ls)
