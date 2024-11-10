extends Marker2D
signal player_moved(current_node: Marker2D)
signal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func move_up():
	emit_signal("player_moved", dest)
func move_down():
	
func move_right():
	
func move_left():

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
