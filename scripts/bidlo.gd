extends CharacterBody2D

const speed = 4000
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player 
var player_in_chat_zone = false

@onready var anim = $AnimationPlayer

enum {
	IDLE,
	NEW_DIR,
	MOVE
}
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	start_pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state == 0 or current_state == 1:
		$AnimatedSprite2D.play("default")
	elif current_state == 2 and !is_chatting:
		if dir.x == 1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	
	if is_roaming:
		match current_state:
			IDLE:
				anim.stop()
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)
				anim.play("walk")
	if Input.is_action_just_pressed("chat"):
		if player_in_chat_zone == true:
			is_roaming = false
			is_chatting = true
			$Control.start()
	if is_chatting == true:
		velocity = Vector2(0,0)
	move_and_slide()
				
func choose(array):
	array.shuffle()
	return array.front()
	
func move(delta):
	if (!is_chatting):
		velocity = dir * speed * delta

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player = body
		player_in_chat_zone = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player_in_chat_zone = false


func _on_timer_timeout():
	if (!is_chatting):
		$Timer.wait_time = choose([0.5, 1, 1.5])
		current_state = choose([IDLE, NEW_DIR, MOVE])


func _on_control_dialogue_finished():
	is_chatting = false
	is_roaming = true
