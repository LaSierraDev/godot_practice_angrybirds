extends Node

const MAIN = preload("res://scenes/ui/main.tscn")
const LEVELS: Dictionary = {
	1: preload("res://scenes/levels/level_1.tscn"),
	2: preload("res://scenes/levels/level_2.tscn"), 
}

var current_level: int = 0
var current_throwing: int = 3:
	get: 
		return current_throwing

var enemies_left: int = 0:
	set(enemies):
		enemies_left = enemies
	get:
		return enemies_left

var is_throwing: bool = true


func _reset_current_throwing() -> void:
	current_throwing = 3
	is_throwing = true


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
		load_next_level.call_deferred()


func decrease_current_throwing() -> void:
	current_throwing -= 1
	
	if current_throwing <= 0:
		is_throwing = false
		print("No se puede lanzar más")
