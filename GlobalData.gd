extends Node
class_name GlobalData

static var instance
var data = "default"
static func get_instance():
	if not instance:
		instance = GlobalData.new()
	return instance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
