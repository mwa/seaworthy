extends "res://scripts/Collectible.gd"

# NOTE: inherited scene requires separate CollisonShape2D, as it would overwrite parent settings


func _ready():
	tween_duration = 0.2


# collision handler
func on_body_entered(body):
	if body.has_method('on_sword_touched'):
		# handle collision
		body.on_sword_touched()
		animate_remove()
