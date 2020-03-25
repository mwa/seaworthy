extends KinematicBody2D


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
