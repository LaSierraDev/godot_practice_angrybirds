extends Camera2D

@onready var player_spawner: Marker2D = $"../PlayerSpawner"

var _player = null

func _ready() -> void:
	player_spawner.player_spawned.connect(_on_player_spawner_player_spawned)
	print(player_spawner.get_signal_connection_list("player_spawned"))

func _process(_delta: float) -> void:
	if not _player:
		return
	
	if _player.position.x >= self.position.x:
		self.position.x = _player.position.x

func _reset_position() -> void:
	self.position.x = 960.0
	self.position.y = 540.0

func _on_player_spawner_player_spawned(player: RigidBody2D) -> void:
	_reset_position()
	if _player != player:
		_player = player
