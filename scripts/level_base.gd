extends Node2D

@onready var enemies: Node2D = $Enemies
@onready var level_complete_timer: Timer = $LevelCompleteTimer


func _ready() -> void:
	var total_enemies: int = enemies.get_child_count()
	GameManager.enemies_left = total_enemies
	level_complete_timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	SignalManager.next_level.emit()
