extends Node2D

const LIMIT_LINEAR_VELOCITY: Vector2 = Vector2(0,800)

@onready var label: Label = $Label


func _process(delta):
	if self.linear_velocity >= LIMIT_LINEAR_VELOCITY:
		queue_free()
	label.text = "LV: " + str(round(self.linear_velocity.length()))
