extends "res://scripts/Collectible.gd"

# NOTE: inherited scene requires separate CollisonShape2D, as it would overwrite parent settings


func _ready():
	tween_duration = 0.3


# collision handler
func on_body_entered(body):
	if body.has_method('on_bad_fish_caught'):
		# handle collision
		body.on_bad_fish_caught(self)
		animate_remove()
