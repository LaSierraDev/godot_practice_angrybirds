extends Control

@onready var launches_label: Label = $MarginContainer/LaunchesLabel

var total_remaining: int =  GameManager.current_throwing
var actual_remaining_throws: int = total_remaining

func _ready() -> void:
	GameManager.decrease_remaining_throws.connect(_on_decrease_counter_remaining_throws)
	_changes_label_counter_rt()

func _changes_label_counter_rt() -> void:
	launches_label.text = "Launches: " + str(actual_remaining_throws) + "/" +  str(total_remaining)

func _on_decrease_counter_remaining_throws() -> void:
	actual_remaining_throws -= 1
	_changes_label_counter_rt()
