extends Node2D

var current_marker: Marker2D = null # a refrence to where the player is at
var Ant = preload("res://ant.tscn")
var player
var player_locs
var enemy_locs
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_locs = get_node("PlayerPositions").get_children()
	enemy_locs = get_node("EnemyPositions").get_children()
	player = Ant.instantiate()
	player.add_to_group("player", true)
	current_marker = player_locs[1]
	current_marker.add_child(player)
	player.position = Vector2(0,0)
	timer = Timer.new()
	timer.wait_time = randf_range(1, 3)  # Set a random wait time between 1 and 10 seconds
	timer.timeout.connect(_on_timeout)
	add_child(timer)  # Add the timer as a child to this node
	timer.start()  # Start the timer
	
func _on_timeout():
	put_into_cell()  # Call the method
	timer.wait_time = randf_range(1, 3)  # Set a new random wait time
	timer.start()  # Restart the timer

func put_into_cell():
	if(enemy_locs[randf_range(0,5)].find_child("")
	#connecting signals
	for loc in player_locs:
		loc.player_moved.connect(on_player_moved)
		loc.player_attacked.connect(_on_player_attack)
	
func set_player_loc(marker: Marker2D):
	current_marker = marker

func on_player_moved(dest: Marker2D, sender: Marker2D) -> Marker2D:
	#remove from old
	
	var parent_node = player.get_parent()
	
	if(dest && parent_node):
		var tween = create_tween()
		print(dest.position)
		print(dest.transform)
		print(dest.global_position)
		print(sender.global_position)
		tween.tween_property(player, "global_position", dest.global_position, .2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EaseType.EASE_IN).from(sender.global_position)
		#parent_node.remove_child(player)
		#dest.add_child(player)
		#player.position = Vector2(0, 0)
		current_marker = dest
		
	else:
		print(dest)
		print(player)
		print("Debug message: somthin is amiss!")
	return dest
	#var anim_player = moving_node.get_node("AnimationPlayer")
	#var animation = anim_player.get_animation("move_animation")
	# Ensure the node is not reparented before the animation is done
	#anim_player.play("move_animation")
	# Use a timer to wait for the animation to finish before reparenting
	#var timer = Timer.new()
	#timer.wait_time = animation_duration
	#timer.connect("timeout", self, "_on_animation_complete")
	#add_child(timer)
	#timer.start()
	#add to new
#func _on_animation_complete():
	#moving_node.get_parent().remove_child(moving_node)
	#new_parent.add_child(moving_node)
	#moving_node.position = Vector2(0, 0)
	#get_node("Timer").queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_player_attack(target: Marker2D, sender: Marker2D):
	# Dynamically create the Tween node
	var tween = create_tween()
	
	#tween.tween_property(player, "position", midpoint, 0.1).set_trans(Tween.TRANS_SINE).set_ease( Tween.EASE_IN_OUT)
	#tween.tween_property(player, "position", Vector2((target.get_position().x - sender.get_position().x), (target.get_position().y-sender.get_position().y)), .1).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	#tween.tween_property(player, "position", player.position, .2).set_trans(Tween.TRANS_LINEAR).set_ease( Tween.EASE_IN_OUT)
	
	tween.tween_property(player, "global_position", target.global_position, .1).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT).from(sender.global_position)
	tween.tween_property(player, "global_position", sender.global_position, .2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

	#player.position = Vector2(0,0)
	

func _on_area_entered(other:Area2D):
	if (not other.is_in_group("player")):
		other.queue_free()
		print("Attacked an enemy!")
	



func _process(delta: float) -> void:
	if()

func _input(event):
	# Ensure an active marker exists
	if current_marker:
		# Check for each input action and call the corresponding function
		if event.is_action_pressed("move_up"):
			current_marker.move_up()
		elif event.is_action_pressed("move_down"):
			current_marker.move_down()
		elif event.is_action_pressed("move_left"):
			current_marker.move_left()
		elif event.is_action_pressed("move_right"):
			current_marker.move_right()
