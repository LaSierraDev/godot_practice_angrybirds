extends Node

const MAIN = preload("res://scenes/ui/main.tscn")
const LEVELS: Dictionary = {
	1: preload("res://scenes/levels/level_1.tscn"),
	2: preload("res://scenes/levels/level_2.tscn"), 
}
const SCORE_SCREEN = preload("uid://bq16u2a41qckq")

var current_level: int = 0
var current_launches: int = 3:
	get: 
		return current_launches

var enemies_left: int = 0:
	set(enemies):
		enemies_left = enemies
	get:
		return enemies_left

var has_been_launched: bool = true:
	get: 
		return has_been_launched

func _ready() -> void:
	SignalManager.next_level.connect(_on_next_level)

func _reset_launches() -> void:
	current_launches = 3
	has_been_launched = true


func load_next_level() -> void:
	current_level += 1
	
	if current_level > LEVELS.size():
		_score_screen()
	else: 
		_reset_launches()
		get_tree().change_scene_to_packed(LEVELS[current_level])


func decrease_enemies_left() -> void:
	if enemies_left < 0: 
		return
	
	enemies_left -= 1
	print("Quedan: " + str(enemies_left) + " enemigos." )
	if enemies_left == 0:
		SignalManager.level_completed.emit()
		has_been_launched = false


func decrease_current_throwing() -> void:
	current_launches -= 1
	
	if current_launches <= 0:
		has_been_launched = false

func _score_screen() -> void: 
		get_tree().change_scene_to_packed(SCORE_SCREEN)

func _on_next_level() -> void:
	load_next_level()
