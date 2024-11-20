extends CanvasLayer


var mouse_captured: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_end"):
		get_tree().paused = true
		visible = true
		release_mouse()

func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false

func _on_button_pressed():
	get_tree().paused = false
	visible = false
	capture_mouse()


func _on_button_2_pressed():
	get_tree().quit()


func _on_button_3_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_button_4_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/options.tscn")
