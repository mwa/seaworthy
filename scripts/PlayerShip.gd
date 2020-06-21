extends KinematicBody2D

signal update_score(points)
signal update_swords(num_swords)
signal game_over(item)


var speed = 200  # speed in pixels/s
var velocity = Vector2.ZERO

var score = 0
var swords = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
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


func on_bad_fish_caught(item):
	$HitSound.play()
	if swords >= 3:
		swords -= 3
		emit_signal("update_swords", swords)
	else:
		$HitSound.connect("finished", $GameOverSound, "play")
		emit_signal("game_over", item)



func on_sword_touched():
	$PickupSoundSword.play()
	swords += 1
	emit_signal("update_swords", swords)
