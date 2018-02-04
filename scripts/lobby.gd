extends Node

func _ready():
	pass

func _on_join_game():
	
	print("join")
	
	var ip = $JoinGame/IP.text
	var player_name = $JoinGame/PlayerName.text

	if player_name ==  "":
		player_name = "Noob"
	
	GameManager.join_game(ip, player_name)

	$JoinGame.hide()
	$CharactersSelect.show()

	pass # replace with function body

func _on_host_game():
	
	var player_name = $HostGame/PlayerName.text
	
	if player_name ==  "":
		player_name = "The Nameless"
	
	GameManager.host_game(player_name)
	
	$HostGame.hide()
	$CharactersSelect.show()
	
	pass # replace with function body
