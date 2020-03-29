extends Node2D


var Fish = load("res://scenes/Fish.tscn")
var BadFish = load("res://scenes/BadFish.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	# spawn a fish every timeout
	$Timer.connect("timeout", self, "spawn_fish")
	$Timer.start()


# spawn a fish at a random position at the top
func spawn_fish():
	var fish
	if randf() < 0.8:
		# create Fish instance
		fish = Fish.instance()
	else:
		# create BadFish instance
		fish = BadFish.instance()

	# set random fish position
	fish.position = Vector2(rand_range(50, 450), -50)
	# add fish to Fishes container node
	$Fishes.add_child(fish)
