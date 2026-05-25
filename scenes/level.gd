extends Node2D

# 1. load scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

var health: int = 3

func _ready() -> void:
	
	# set up health ui
	get_tree().call_group('ui', 'set_health', health)
	
	var size := get_viewport().get_visible_rect().size;
	var rng := RandomNumberGenerator.new()
	var stars = $Stars.get_children()
	
	for star in stars:
		# position
		var random_x = rng.randi_range(0, int(size.x))
		var random_y = rng.randi_range(0, int(size.y))
		star.position = Vector2(random_x, random_y)
		
		# scale
		var random_scale = rng.randf_range(1,2)
		star.scale = Vector2(random_scale, random_scale)
		
		# speed
		star.speed_scale = rng.randf_range(0.6, 1.4)
		

func _on_meteor_timer_timeout() -> void:
	# 2. create an instance
	var meteor = meteor_scene.instantiate()
	
	# 3. attach the node
	$Meteors.add_child(meteor)
	
	# connect the signal
	meteor.connect('collision', _on_meteor_collision)
	
func _on_meteor_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	$Player.on_collision_sound()
	if health <= 0:
		get_tree().call_deferred('change_scene_to_file', "res://scenes/game_over.tscn")

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	
	$Lasers.add_child(laser)
	laser.position = pos
