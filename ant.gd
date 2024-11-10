extends Area2D

var is_atacking: bool = false
var pill_bug = preload("res://pill_bug.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(other:Area2D):
	if other.is_in_group("enemies"):
		# Logic for hitting an enemy
		print("Attacked an enemy!")
		area.take_damage(10)
	if((other is pill_bug, p)):
		if(is_atacking & p.is_attacking ):
	
