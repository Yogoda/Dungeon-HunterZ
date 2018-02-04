extends Area2D

var i_pos = 0
var j_pos = 0
var i_pos_new = 0
var j_pos_new = 0
var player_num = 0
var ini = false
var player_control = true
var death = false
var move_input = "none"
const MOVE_DELAY = .2
var move_delay = MOVE_DELAY

func _ready():
	_position_ini()
	pass

func _process(delta):
	move_delay -= delta
	if move_delay < 0:
		player_control = true
		move_delay = MOVE_DELAY
		
	if ini == false:
		_hero_ini()
		ini = true
		
	if not move_input == "none":
		if player_control == true:
			if move_input == "left":
				if i_pos > 0:
					if Map.array_map_obst[i_pos-1][j_pos] == 0:
						i_pos_new = i_pos-1
			if move_input == "right":
				if i_pos < Map.tile_i_max-1:
					if Map.array_map_obst[i_pos+1][j_pos] == 0:
						i_pos_new = i_pos+1
			if move_input == "top":
				if j_pos > 0:
					if Map.array_map_obst[i_pos][j_pos-1] == 0:
						j_pos_new = j_pos -1
			if move_input == "down":
				if j_pos < Map.tile_j_max-1:
					if Map.array_map_obst[i_pos][j_pos+1] == 0:
						j_pos_new = j_pos+1
			if not i_pos == i_pos_new or not j_pos == j_pos_new:
				player_control = false
				
		move_input = "none"
	
	if not i_pos_new == i_pos or not j_pos_new == j_pos:
		#free the slot
		Map.array_map_obst[i_pos][j_pos] = 0
		i_pos = i_pos_new
		j_pos = j_pos_new
		#fill the slot
		Map.array_map_obst[i_pos][j_pos] = 1
		_position_ini()
	pass
	
func _input(event):
	move_input = "none"
	#controls
	if event.is_action("ui_left"):
		move_input = "left"
	if event.is_action("ui_right"):
		move_input = "right"
	if event.is_action("ui_up"):
		move_input = "top"
	if event.is_action("ui_down"):
		move_input = "down"
		

func _position_ini():
	position.x = i_pos * Map.tile_size+Map.dungeon_left_margin + Map.tile_size/2
	position.y = j_pos * Map.tile_size+Map.dungeon_top_margin + Map.tile_size/6
	pass
	
func _hero_ini():
	var hero_sprite = "res://sprites/heroes/hero01.png"
	if player_num == 0:
		hero_sprite = "res://sprites/heroes/hero01.png"
	if player_num == 1:
		hero_sprite = "res://sprites/heroes/hero02.png"
	if player_num == 2:
		hero_sprite = "res://sprites/heroes/hero03.png"
	if player_num == 3:
		hero_sprite = "res://sprites/heroes/hero04.png"
		
	$Player_Sprite.texture = load(hero_sprite)
	pass
	