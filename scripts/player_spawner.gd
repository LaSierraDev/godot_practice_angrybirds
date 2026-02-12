extends Marker2D

@onready var player_Scene: PackedScene = preload("res://scenes/player.tscn")

signal player_spawned(player_instance: RigidBody2D)

func _ready() -> void:
	_create_player()

func _create_player() -> void:
	var player_instance = player_Scene.instantiate()
	self.add_sibling.call_deferred(player_instance)
	player_instance.position = self.position
	player_instance.tree_exited.connect(_on_player_tree_exited)
	player_spawned.emit(player_instance)

func _on_player_tree_exited() -> void:
	_create_player()
