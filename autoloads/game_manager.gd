extends Node

const MAIN = preload("res://scenes/ui/main.tscn")
const LEVELS: Dictionary = {
	1: preload("res://scenes/levels/level_1.tscn"),
	2: preload("res://scenes/levels/level_2.tscn"), 
}

var current_level: int = 0

func load_next_level() -> void:
	current_level += 1
	
	if current_level > LEVELS.size():
		return
	else: get_tree().change_scene_to_packed(LEVELS[current_level])
