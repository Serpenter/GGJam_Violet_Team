extends KinematicBody

var INITIAL_SPEED = 5.0
var speed = 0.0
var starting_position = Vector3(0.0, 0.0, 20.0)

var face_direction

var LAZOR_BULLET = preload("res://Bullet/LazorBullet.tscn")

signal custom_intersection(object)

func _ready():
	speed = INITIAL_SPEED
	face_direction = Vector3(0.0, 0.0, -1.0)

func _process(delta):
	
	var spatial_node = get_node("Spatial")
	if spatial_node.state == spatial_node.STATE.FAINT:
		return
		
	var motion = Vector3()
	if Input.is_action_pressed("move_down"):
		motion += Vector3(0.0, 0.0, -1.0)
	if Input.is_action_pressed("move_up"):
		motion += Vector3(0.0, 0.0, 1.0)
	if Input.is_action_pressed("move_left"):
		motion += Vector3(1.0, 0.0, 0.0)
	if Input.is_action_pressed("move_right"):
		motion += Vector3(-1.0, 0.0, 0.0)
		
	motion = motion.normalized()
	
	if motion:
		face_direction = motion.normalized()
		
	motion = motion * speed
	
	move_and_slide(motion)	
	
	if Input.is_action_just_pressed("fire"):
		fire_mah_lazors()
	
	
func fire_mah_lazors():
	var bullet = LAZOR_BULLET.instance()
	bullet.global_transform  = global_transform 
	bullet.velocity = face_direction * bullet.speed
	bullet.add_to_group("Player1")
	get_parent().add_child(bullet)
