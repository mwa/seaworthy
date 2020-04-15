extends Area2D

# NOTE: base scene and script for collectible items, add CollisionShape2D in inherited scenes


var speed = 120  # speed in pixels/s
var velocity = Vector2(0, speed)

var tween = null
var tween_duration = 0.3


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


func animate_remove():
	# animate and remove
	z_index = 2
	tween.connect('tween_all_completed', self, 'remove')
	tween.start()


func _on_Collectible_body_entered(body):
	on_body_entered(body)


# collision handler
func on_body_entered(body):
	# implement in subclasses
	pass
	remove()
