extends Node

const MAIN = preload("res://scenes/ui/main.tscn")
const LEVELS: Dictionary = {
	1: preload("res://scenes/levels/level_1.tscn"),
	2: preload("res://scenes/levels/level_2.tscn"), 
}

var current_level: int = 0
var enemies_left: int = 0:
	set(enemies):
		enemies_left = enemies
	get:
		return enemies_left

func load_next_level() -> void:
	current_level += 1
	
	if current_level > LEVELS.size():
		return
	else: get_tree().change_scene_to_packed(LEVELS[current_level])

func decrease_enemies_left() -> void:
	if enemies_left < 0: 
		return
	
	enemies_left -= 1
	print("Quedan: " + str(enemies_left) + " enemigos." )
	if enemies_left == 0:
		load_next_level()
