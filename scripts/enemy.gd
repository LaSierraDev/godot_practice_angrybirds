extends RigidBody2D

@export var velocity_treshold: float = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func destroy_me() -> void:
	queue_free()

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		destroy_me()
		return
	
	if body is RigidBody2D and body.linear_velocity.length() > velocity_treshold:
		print("Body Linear_velocity sin normalizar: " + str(body.linear_velocity))
		print("Body Linear_velocity normalizada: " + str(body.linear_velocity.normalized()))
		if body.linear_velocity.normalized().y > 0:
			destroy_me()
