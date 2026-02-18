extends Timer

const w_time: int = 2

func _ready() -> void:
	SignalManager.level_completed.connect(_on_level_completed)
	self.wait_time = w_time
	self.one_shot = true


func _on_level_completed() -> void:
	self.start()
