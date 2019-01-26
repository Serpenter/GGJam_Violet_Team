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
	if Input.is_action_pressed("move_up_p2"):
		motion += Vector3(0.0, 0.0, -1.0)
	if Input.is_action_pressed("move_down_p2"):
		motion += Vector3(0.0, 0.0, 1.0)
	if Input.is_action_pressed("move_right_p2"):
		motion += Vector3(1.0, 0.0, 0.0)
	if Input.is_action_pressed("move_left_p2"):
		motion += Vector3(-1.0, 0.0, 0.0)
		
	motion = motion.normalized() * speed
	
	move_and_slide(motion)	
