extends Node2D

var items: Dictionary = {"potions": 5,
"arrows": 20,
"coins": 5}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	items["rings"] = 33232
	print_rich("[color=green][b]" + str(items) + "[/b][/color]")
	print(items["rings"])
	for key in items: 
		print(key + ": " + str(items[key]))
	
