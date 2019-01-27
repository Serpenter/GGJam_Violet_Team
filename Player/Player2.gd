extends KinematicBody

var INITIAL_SPEED = 5.0
var speed = 0.0
var starting_position = Vector3(0.0, 0.0, 20.0)

var face_direction

var item_drop_distance = 1.2
onready var rocket = get_node("/root/MainNode/Rocket/Rocket")

var LAZOR_BULLET = preload("res://Bullet/LazorBullet.tscn")

var BLUE_BOX = preload("res://Collectibles/box_blue.tscn")
var GREEN_BOX = preload("res://Collectibles/box_green.tscn")
var DARK_GREEN_BOX = preload("res://Collectibles/box_dark_green.tscn")
var VIOLET_BOX = preload("res://Collectibles/box_violet.tscn")
var PINK_BOX = preload("res://Collectibles/box_pink.tscn")
var YELLOW_BOX = preload("res://Collectibles/box_yellow.tscn")

signal custom_intersection(object)

func _ready():
	speed = INITIAL_SPEED
	face_direction = Vector3(0.0, 0.0, -1.0)

func _process(delta):
	
	if(rocket.get_player_2_hide()):
		visible = false
	var spatial_node = get_node("Spatial")
	if spatial_node.state == spatial_node.STATE.FAINT:
		return
		
	var motion = Vector3()
	if Input.is_action_pressed("move_down_p2"):
		motion += Vector3(0.0, 0.0, -1.0)
	if Input.is_action_pressed("move_up_p2"):
		motion += Vector3(0.0, 0.0, 1.0)
	if Input.is_action_pressed("move_left_p2"):
		motion += Vector3(1.0, 0.0, 0.0)
	if Input.is_action_pressed("move_right_p2"):
		motion += Vector3(-1.0, 0.0, 0.0)
		
	motion = motion.normalized()
	
	if motion:
		face_direction = motion.normalized()
		get_node("Spatial").on_move()
		
	motion = motion * speed
	
	move_and_slide(motion)	
	
	if Input.is_action_just_pressed("fire_p2"):
		fire_mah_lazors()
		
	if Input.is_action_pressed("accelerate_p2"):
		get_node("Spatial").on_accelerate()
	
	
func fire_mah_lazors():
	var spatial = get_node("Spatial")
	if spatial.can_fire():
		var bullet = LAZOR_BULLET.instance()
		bullet.global_transform  = global_transform 
		bullet.velocity = face_direction * bullet.speed
		bullet.add_to_group("Player2")
		get_parent().add_child(bullet)
		spatial.decrease_o2_from_firing()
		
func on_faint():
	var area = get_node("/root/MainNode/Players/Player2/PlayerArea2/Spatial/Area")
	var inventory = area.inventory
	if inventory:
		var last_item = inventory.back()
		var droped_item
		if last_item == "fuel":
			droped_item = BLUE_BOX.instance()
		elif last_item == "nut":
			droped_item = DARK_GREEN_BOX.instance()
		elif last_item == "ducktape":
			droped_item = GREEN_BOX.instance()
		elif last_item == "machinery":
			droped_item = PINK_BOX.instance()
		elif last_item == "screwdriver":
			droped_item = VIOLET_BOX.instance()
		elif last_item == "chip":
			droped_item = YELLOW_BOX.instance()
			
		area.inventory.pop_back()
		
		var playerUI = get_node("../../UI/PlayerUI")
		playerUI.item_dropped(2)
		
		droped_item.global_transform  = global_transform
		get_parent().add_child(droped_item)
		
		var globalTranslate = face_direction * item_drop_distance
		droped_item.translate(get_global_transform().basis.xform(globalTranslate))
		droped_item.rotate_y(PI)
		
		