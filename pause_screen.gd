extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		unpause()
		get_tree().root.set_input_as_handled()  # ← Add this line
		
func unpause():
	print('unpause')
	get_tree().paused = false
	queue_free()
