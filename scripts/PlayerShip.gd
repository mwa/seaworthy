extends KinematicBody2D

signal change_score(points)

var speed = 200  # speed in pixels/s
var velocity = Vector2.ZERO


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


# handle collision with fish
func on_fish_touched():
	$PickupSound.play()
	emit_signal("change_score", 1)

func on_bad_fish_caught():
	$HitSound.play()
	emit_signal("change_score", -10)
