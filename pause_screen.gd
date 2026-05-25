extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("pause")):
		unpause()
		
func unpause():
	print('unpause')
	get_tree().paused = false
	get_tree().call_deferred('change_scene_to_file', "res://scenes/level.tscn")
	
