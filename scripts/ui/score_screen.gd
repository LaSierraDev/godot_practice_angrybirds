extends Control

@onready var v_box_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in GameManager.level_score:
		var label: Label = Label.new()
		v_box_container.add_child(label)
		label.text = "Level " + str(level) + ": " + str(GameManager.level_score[level])
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
