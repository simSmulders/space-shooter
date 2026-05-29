extends Node

var score := 0
var high_score := 0
var high_score_file := "user://high_score.save"

func _ready() -> void:
	load_high_score()
	
func load_high_score():
	if FileAccess.file_exists(high_score_file):
		var file = FileAccess.open(high_score_file, FileAccess.READ)
		high_score = file.get_var()
		print("High score loaded:", high_score)
	else:
		high_score = 0
		print("No high score file found")

func save_high_score(new_score):
	if new_score > high_score:
		high_score = new_score
		var file = FileAccess.open(high_score_file, FileAccess.WRITE)
		file.store_var(high_score)
		print("New high score saved: ", high_score)
	
