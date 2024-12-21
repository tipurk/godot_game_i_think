extends Control

var change_scene_to : String

func _ready():
	%Timer.start()
	
func _on_timer_timeout():
	print("Loaded")
	get_tree().change_scene_to_file(change_scene_to)
	Global.loadingScreen.queue_free()
