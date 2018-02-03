extends Node

func _ready():
	pass

func _on_join_game():
	
	print("join")
	
	var ip = $JoinGame/IP.text
	var player_name = $JoinGame/PlayerName.text
	
	GameManager.join_game(ip, player_name)

	pass # replace with function body

func _on_host_game():
	
	var player_name = $HostGame/PlayerName.text
	
	GameManager.host_game(player_name)
	
	pass # replace with function body
