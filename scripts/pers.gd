extends CharacterBody2D
class_name Pers
@export var speed = 200

@onready var hat : Sprite2D = $Santahat
@onready var circle : Area2D = $Area2D
var new_texture = preload("res://sprites/hat/fuckhat.png")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("sprint"):
		speed *= 2
	if Input.is_action_just_released("sprint"):
		speed /= 2
	if !Input.get_vector("left", "right", "up", "down"):
		$AnimatedSprite2D.play("pered")
	else:
		if Input.is_action_pressed("sprint"):
			$AnimatedSprite2D.play("beg")
		elif Input.is_action_pressed("up"):
			$AnimatedSprite2D.play("zad")
		elif !Input.is_action_pressed("up"):
			$AnimatedSprite2D.play("lol")
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.flip_h = true
		hat.flip_h = true
		hat.offset.x = 7
		circle.rotation = 91.3
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.flip_h = false
		hat.flip_h = false
		hat.offset.x = 0
		circle.rotation = 0
	if Input.is_action_just_pressed("chat"):
		var bodies = circle.get_overlapping_bodies()
		for body in bodies:
			if body.is_in_group("interactble"):
				body.interact(self)
	if Input.is_action_just_pressed("ui_end"):
		get_tree().paused = true
		$pmenu.visible = true
func _physics_process(delta):
	get_input()
	move_and_slide()
	Global.set_player_y(position.y)
	Global.set_player_x(position.x)
func hat_smenyat():
	hat.texture = new_texture

