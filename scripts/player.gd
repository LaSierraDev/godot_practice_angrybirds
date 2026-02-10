extends RigidBody2D

var is_dragged: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sleeping_state_changed.connect(_on_sleeping_state_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if is_dragged:
		self.position = get_global_mouse_position()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		print(event)
		is_dragged = true

	if event.is_action_released("drag"):
		is_dragged = false
		self.freeze = false

func _on_sleeping_state_changed() -> void:
	self.queue_free()
