extends Button

func _ready():
	
	connect("pressed", self, "on_pressed")
	pass
	
func on_pressed():
	print("bulbitruc")
