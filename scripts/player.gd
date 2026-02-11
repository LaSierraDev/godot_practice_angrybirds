extends RigidBody2D

@onready var line_2d: Line2D = $Line2D

@export var force_impulse: float = 10.0
@export var max_drag_distances: float = 150.0

var is_dragged: bool = false
var is_moved: bool = false
var start_position: Vector2

func _ready() -> void:
	start_position = self.position
	sleeping_state_changed.connect(_on_sleeping_state_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if is_dragged:
		_drag()
		_update_line() 
		_check_release()

func _update_line():
	_clean_points()
	line_2d.add_point(to_local(start_position))
	line_2d.add_point(to_local(self.position))

func _clean_points() -> void:
	line_2d.clear_points()

func _check_release():
	if Input.is_action_just_released("drag"):
		_impulse()
		_clean_points()

func _drag():
	var mouse_position = get_global_mouse_position()
	var drag_vector = mouse_position - start_position
	
	if drag_vector.length() > max_drag_distances:
		drag_vector = drag_vector.normalized() * max_drag_distances
	
	if drag_vector.x > 0: 
		drag_vector.x = 0
	
	self.position = start_position + drag_vector

func _impulse():
	is_dragged = false
	self.freeze = false
	self.input_pickable = false
	var force_vector: Vector2 = start_position - self.position
	apply_impulse(force_vector * force_impulse)

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
		
	if event.is_action_pressed("drag"):
		if event.position != self.position:
			is_dragged = true
		else: 
			is_dragged = false

func _on_sleeping_state_changed() -> void:
	self.queue_free()
