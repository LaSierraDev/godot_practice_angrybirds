extends Button

const LEVEL_1 = preload("uid://ca67vttmdke7q")
const LEVEL_2 = preload("uid://eh8stvlb2xed")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_1)

func _on_toggled(toggled_on: bool) -> void:
	print("Botón toogleado")
