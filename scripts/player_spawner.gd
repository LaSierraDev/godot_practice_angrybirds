extends Marker2D

signal player_spawned(player_instance: RigidBody2D)

const PLAYER_SCENE: PackedScene  = preload("uid://5o4ebuukf5cd")

func _ready() -> void:
	_create_player()

func _create_player() -> void:
	var player_instance = PLAYER_SCENE.instantiate()
	self.add_sibling.call_deferred(player_instance)
	player_instance.position = self.position
	player_instance.tree_exited.connect(_on_player_tree_exited)
	player_spawned.emit(player_instance)

func _on_player_tree_exited() -> void:
	if GameManager.has_been_launched:
		_create_player()
