extends Control

@export var level_scene: PackedScene

func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)
	$CenterContainer/VBoxContainer/MarginContainer/Label3.text = $CenterContainer/VBoxContainer/MarginContainer/Label3.text + str(Global.high_score)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().change_scene_to_packed(level_scene)
		
