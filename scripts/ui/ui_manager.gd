extends Control

@onready var launches_label: Label = $MarginContainer/LaunchesLabel

var total_launches: int =  GameManager.current_throwing
var actual_launches: int = total_launches

func _ready() -> void:
	SignalManager.player_launched.connect(_on_player_launched)
	_changes_label_counter_rt()

func _changes_label_counter_rt() -> void:
	launches_label.text = "Launches: " + str(actual_launches) + "/" +  str(total_launches)

func _on_player_launched() -> void:
	actual_launches -= 1
	_changes_label_counter_rt()
