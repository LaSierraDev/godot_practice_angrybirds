extends Marker2D

@export var player_Scene: PackedScene = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_create_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _create_player() -> void:
	var player_instance = player_Scene.instantiate()
	self.add_sibling.call_deferred(player_instance)
	player_instance.position = self.position
	player_instance.tree_exited.connect(_on_player_tree_exited)

func _on_player_tree_exited() -> void:
	_create_player()
