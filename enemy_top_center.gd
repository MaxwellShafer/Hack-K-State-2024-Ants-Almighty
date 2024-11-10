extends "res://enemy_positions.gd"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = self.get_parent() # Replace with function body.
	

func move_up():
	emit_signal("player_attacked")
func move_down():
	emit_signal("player_attacked")
func move_right():
	emit_signal("player_attacked")
func move_left():
	emit_signal("player_moved",parent.get_child(bot_center_index), self)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
