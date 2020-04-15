extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_score(score):
	$ScoreLabel.text = str(score)

func update_swords(num_swords):
	$Sword/Label.text = str(num_swords)
