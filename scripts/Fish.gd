extends Area2D


var speed = 150  # speed in pixels/s
var velocity = Vector2(0, speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# remove after bottom has been reached
	if position.y > 850:
		remove()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# update position
	position += velocity * delta


func remove():
	queue_free()


# collision handler
func _on_Fish_body_entered(body):
	if body.has_method('on_fish_touched'):
		# handle collision
		body.on_fish_touched()
		remove()
