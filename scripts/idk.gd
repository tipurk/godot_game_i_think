extends StaticBody2D

@export var item: InvItem

var tex = preload("res://sprites/hat/fuckhat.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact(pers:Pers):
	pers.hat_smenyat(tex)
	playercollect(pers)
	await get_tree().create_timer(0.1).timeout
	self.queue_free()
	
func playercollect(pers:Pers):
	pers.collect(item)
