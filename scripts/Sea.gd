extends Node2D

var score


var Fish = load("res://scenes/Fish.tscn")
var BadFish = load("res://scenes/BadFish.tscn")
var Sword = load("res://scenes/Sword.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()


func new_game():
	score = 0
	_on_PlayerShip_change_score(0)
	_on_PlayerShip_update_swords(0)
	# spawn a fish every timeout
	$Timer.connect("timeout", self, "spawn_fish")
	$Timer.start()


func _on_PlayerShip_change_score(points):
	score += points
	$HUD.update_score(score)


func _on_PlayerShip_update_swords(num_swords):
	$HUD.update_swords(num_swords)


# spawn a fish at a random position at the top
func spawn_fish():
	var collectible
	var random_value = randf()
	if random_value < 0.7:
		# create Fish instance
		collectible = Fish.instance()
	elif randf() < 0.8:
		# create BadFish instance
		collectible = BadFish.instance()
	else:
		# create Sword instance
		collectible = Sword.instance()

	# set random collectible position
	collectible.position = Vector2(rand_range(50, 450), -50)
	# add fish to Collectibles container node
	$Collectibles.add_child(collectible)
