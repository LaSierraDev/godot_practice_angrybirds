extends Node2D

@onready var enemies: Node2D = $Enemies


func _ready() -> void:
	var total_enemies: int = enemies.get_child_count()
	GameManager.enemies_left = total_enemies
