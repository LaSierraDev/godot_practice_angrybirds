class_name StateMachine
extends Node
## Hierarchical state machine for the player.
##
## Initializes states and delegates engine callbacks
## (_physics_process, _unhandled_input) to the active state.

# ============================== SIGNALS (public) ===================================== #
signal state_changed(previous_state: Node, new_state: Node)

# ============================== CONSTANTS (public) ===================================== #
const CONSTS: bool = true

# ============================== EXPORT VAR (public) ===================================== #
@export var initial_state: Node

# ============================== VARIABLES (public) ===================================== #
var is_active: bool = true:
	set = set_is_active

# ============================== VARIABLES (private) ===================================== #
@onready var _state: Node = initial_state:
	set = set_state

@onready var _state_name: String = ""

# ============================== ENGINE CALLBACKS ===================================== #

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	pass

# ============================== MÉTODOS SOBRESCRITOS PERSONALIZADOS ===================================== #
# (No hay en este caso)

# ============================== MÉTODOS RESTANTES (public) ===================================== #

func transition_to(target_state_path: NodePath, msg: Dictionary = {}) -> void:
	pass

func set_is_active(value: bool) -> void:
	pass

func set_state(value: Node) -> void:
	pass

# ============================== MÉTODOS RESTANTES (private) ===================================== #

func _on_state_changed(previous_state: Node, new_state: Node) -> void:
	pass

# ============================== SUBCLASSES ===================================== #

class State:
	var foo: int = 0

	func _init() -> void:
		pass
