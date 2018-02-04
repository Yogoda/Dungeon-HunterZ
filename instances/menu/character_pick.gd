extends Panel

export var character_id = 1

signal charater_selected

func _ready():
	pass

func _on_picked_by_toggled(button_pressed):
	
	if button_pressed:
		$PickedBy.text = GameManager.player_name
		emit_signal("charater_selected", GameManager.PEER_ME, character_id, true)
	else:
		$PickedBy.text = "Pick Me"
		emit_signal("charater_selected", GameManager.PEER_ME, character_id, false)

	rpc("picked_by_toggle", button_pressed, $PickedBy.text)

#receiving character selection from peer
remote func picked_by_toggle(pressed, name):
	
	$PickedBy.pressed = pressed
	$PickedBy.text = name
	
	if pressed:
		$PickedBy.disabled = true
		emit_signal("charater_selected", GameManager.PEER_YOU, character_id, true)
	else:
		$PickedBy.disabled = false
		emit_signal("charater_selected", GameManager.PEER_YOU, character_id, false)