extends Area2D


var speed = 150  # speed in pixels/s
var velocity = Vector2(0, speed)

var tween = null
var tween_duration = 0.2


func _ready():
	# setup tween animation
	tween = Tween.new()
	tween.interpolate_property(
		$Sprite, 'scale',
		$Sprite.get_scale(), Vector2.ONE * 1.5, tween_duration,
		Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.interpolate_property(
		$Sprite, 'modulate:a',
		$Sprite.modulate.a, 0, tween_duration,
		Tween.TRANS_QUAD, Tween.EASE_OUT)
	add_child(tween)


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

		# animate
		z_index = 2
		tween.connect('tween_all_completed', self, 'remove')
		tween.start()
