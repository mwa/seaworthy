extends KinematicBody2D

signal update_score(points)
signal update_swords(num_swords)


var speed = 200  # speed in pixels/s
var velocity = Vector2.ZERO

var score = 0
var swords = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


# get input actions
func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		# move left
		velocity += -transform.x * speed
	if Input.is_action_pressed("ui_right"):
		# move right
		velocity += transform.x * speed


# handle collisions with collectibles

func on_fish_touched():
	$PickupSound.play()
	score += 1
	emit_signal("update_score", score)


func on_bad_fish_caught():
	$HitSound.play()
	score -= 10
	emit_signal("update_score", score)


func on_sword_touched():
	$PickupSound.play()
	swords += 1
	emit_signal("update_swords", swords)
