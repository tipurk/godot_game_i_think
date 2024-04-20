extends Node

var player_y:float;
var player_x:float;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_player_y(y: float):
	player_y=y;
	
func set_player_x(x: float):
	player_x=x;

