extends Node2D

var speed = 120  # speed in pixels/s
var velocity = Vector2(0, speed)

signal level_finished()

func _ready():
	deactivate()
	activate()

func activate():
	position.y = -128
	print(position)
	self.visible = true

func deactivate():
	self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# update position
	position += velocity * delta
	if position.y > 600:
		emit_signal("level_finished")
