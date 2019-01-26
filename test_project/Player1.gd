extends KinematicBody

var INITIAL_SPEED = 5.0
var speed = 0.0
var starting_position = Vector3(0.0, 0.0, 20.0)

func _ready():
	speed = INITIAL_SPEED

func _process(delta):
	
	var spatial_node = get_node("Spatial")
	if spatial_node.state == spatial_node.STATE.FAINT:
		return
		
	var motion = Vector3()
	if Input.is_action_pressed("move_up"):
		motion += Vector3(0.0, 0.0, -1.0)
	if Input.is_action_pressed("move_down"):
		motion += Vector3(0.0, 0.0, 1.0)
	if Input.is_action_pressed("move_right"):
		motion += Vector3(1.0, 0.0, 0.0)
	if Input.is_action_pressed("move_left"):
		motion += Vector3(-1.0, 0.0, 0.0)
		
	motion = motion.normalized() * speed
	
	move_and_slide(motion)	
