extends CharacterBody2D

@export var speed := 500
signal laser(pos)
var is_cooled := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	# shoot
	if Input.is_action_just_pressed("shoot") && is_cooled:
		laser.emit($LaserStartPos.global_position)
		is_cooled = false;
		$LaserTimer.start()
		$LaserSound.play()
		
func on_collision_sound():
	$CollisionSound.play();

func _on_laser_timer_timeout() -> void:
	is_cooled = true;
