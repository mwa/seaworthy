extends Area2D

var speed = 80  # speed in pixels/s
var velocity = Vector2(0, speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if position.y > 0:
		position.y = -128


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# update position
	position += velocity * delta
