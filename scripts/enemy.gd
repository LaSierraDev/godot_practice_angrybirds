extends RigidBody2D

@onready var explotion_scene: PackedScene = preload("res://scenes/explotion.tscn")

@export var velocity_treshold: float = 100.0

var explotion_scene_instantiate

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	explotion_scene_instantiate = explotion_scene.instantiate()

func _destroy_me() -> void:
	_create_explotion()
	queue_free()

func _create_explotion() -> void:
	add_sibling(explotion_scene_instantiate)
	explotion_scene_instantiate.position = self.position

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		_destroy_me()
		return
	
	if body is RigidBody2D and body.linear_velocity.length() > velocity_treshold:
		if body.linear_velocity.normalized().y > 0:
			_destroy_me()
