extends Area2D

var random_speed : int
var random_direction : float
var rotation_speed : int

signal collision

var can_collide := true
	
func _ready() -> void:
	
	var rng := RandomNumberGenerator.new()
	
	var path: String = "res://graphics/Meteors/" + str(rng.randi_range(1,6)) + ".png"
	$Sprite2D.texture = load(path)
	
	# start position
	var width = get_viewport().get_visible_rect().size[0]
	
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	# speed / direction / rotation
	random_speed = rng.randi_range(200, 500)
	random_direction = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40, 100)
	

func _process(delta: float) -> void:
	position += Vector2(random_direction, 1.0) * random_speed * delta
	rotation_degrees += rotation_speed * delta


func _on_body_entered(_body) -> void:
	if can_collide:
		collision.emit()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	$ExplosionSound.play()
	$Sprite2D.hide()
	can_collide = false
	await get_tree().create_timer(1).timeout
	queue_free()
