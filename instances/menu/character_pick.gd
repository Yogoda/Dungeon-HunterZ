extends Panel

func _ready():
	pass

func _on_picked_by_toggled(button_pressed):
	
	if button_pressed:
		$PickedBy.text = GameManager.player_name
	else:
		$PickedBy.text = "Pick Me"

	rpc("picked_by_toggle", $PickedBy.text)

remote func picked_by_toggle(name):
	
	print("toggle")
	$PickedBy.pressed = !$PickedBy.pressed
	$PickedBy.text = name