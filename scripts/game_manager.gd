extends Node

# Default game port
const DEFAULT_PORT = 10567

# Max number of players
const MAX_PEERS = 1

# Name for my player
var player_name

# Names for remote players in id:name format
var players = {}

func _ready():
	get_tree().connect("network_peer_connected", self, "on_player_connected")

func on_player_connected(player_id):
	print("player " + str(player_id) + " connected")
	
func host_game(new_player_name):
	
	player_name = new_player_name
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PEERS)
	get_tree().set_network_peer(peer)

func join_game(ip, new_player_name):
	
	player_name = new_player_name
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip, DEFAULT_PORT)
	get_tree().set_network_peer(peer)