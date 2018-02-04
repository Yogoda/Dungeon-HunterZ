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

func create_map(w, h):
	var map = []
	
	for x in range(w):
		var col = []
		col.resize(h)
		map.append(col)
	
	return map