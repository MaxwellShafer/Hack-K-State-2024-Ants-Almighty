extends Marker2D
signal player_moved(dest: Marker2D, sender: Marker2D)
signal player_attacked(dest: Marker2D, is_ranged: bool)

var parent
var enemy_locations
var top_back_index = 0
var top_center_index = 1
var top_front_index = 2
var bot_back_index = 3
var bot_center_index = 4
var bot_front_index = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
