extends Control

@onready var launches_label: Label = $MarginContainer/LaunchesLabel
@onready var level_completed_label: Label = $MarginContainer/LevelCompletedLabel

var total_launches: int = GameManager.current_launches
var actual_launches: int = total_launches
var actual_enemies: int = GameManager.enemies_left

func _ready() -> void:
	SignalManager.player_launched.connect(_on_player_launched)
	SignalManager.level_completed.connect(_on_level_complete)
	_changes_label_counter_rt()

func _changes_label_counter_rt() -> void:
	launches_label.text = "Launches: " + str(actual_launches) + "/" +  str(total_launches)

func _on_player_launched() -> void:
	actual_launches -= 1
	_changes_label_counter_rt()

func _on_level_complete() -> void:
	if actual_enemies == 0:
		level_completed_label.visible = true
		launches_label.visible = false
