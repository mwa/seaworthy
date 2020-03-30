extends Node2D

var score

var Fish = load("res://scenes/Fish.tscn")
var BadFish = load("res://scenes/BadFish.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()

func new_game():
	score = 0
	_on_PlayerShip_change_score(0)
	# spawn a fish every timeout
	$Timer.connect("timeout", self, "spawn_fish")
	$Timer.start()

func _on_PlayerShip_change_score(points):
	score += points
	$HUD.update_score(score)

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
