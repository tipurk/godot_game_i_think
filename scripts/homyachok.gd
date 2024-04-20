extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact(pers:Pers):
	$AudioStreamPlayer2D.play()
	$VideoStreamPlayer.play()
	if $VideoStreamPlayer.is_playing():
		$Sprite2D.hide()
		$CollisionShape2D.queue_free()
