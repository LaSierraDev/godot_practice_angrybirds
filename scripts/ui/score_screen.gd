extends Control

@onready var v_box_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in GameManager.level_score:
		var label: Label = Label.new()
		label.text = "Level " + str(level) + ": " + str(GameManager.level_score[level])
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		v_box_container.add_child(label)
	
	var reset_button: Button = Button.new()
	reset_button.pressed.connect(_on_pressed_button)
	reset_button.text = "Reset game"
	v_box_container.add_child(reset_button)

func _on_pressed_button() -> void:
	GameManager._reset_game()
