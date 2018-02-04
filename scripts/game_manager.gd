extends Node
#i size of the map
var tile_i_max = 20
#j size of the map
var tile_j_max = 12
#tile size in pixels
var tile_size = 64
# map ...
var array_map_tile = []
var array_map_obst = []
var dungeon_left_margin = 100
var dungeon_top_margin = 50

#############################
#############################

# Default game port
const DEFAULT_PORT = 10567

# Max number of players
const MAX_PEERS = 1

const PEER_ME = 0
const PEER_YOU = 1

# Name for my player
var player_name = "Bulbi"

# Names for remote players in id:name format
var players = {}

var characters = []

func add_character(id):
	characters.append(id)
	show_characters()
	
func remove_character(id):
	characters.erase(id)
	show_characters()
	
func show_characters():
	for c in characters:
		print("character:" + str(c))

func _ready():
	#initialize map
	var i
	var j
	array_map_tile = create_map(tile_i_max,tile_j_max)
	array_map_obst = create_map(tile_i_max,tile_j_max)
	for i in range(tile_i_max):
		for j in range(tile_j_max):
			array_map_tile[i][j] = "floor_stone"
			array_map_obst[i][j] = 0
	
	
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
	
func create_map(w, h):
	var map = []
	
	for x in range(w):
		var col = []
		col.resize(h)
		map.append(col)
	
	return map