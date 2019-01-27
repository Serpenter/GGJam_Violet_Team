extends Area

var velocity = Vector3()
var speed = 10

var damage = 2
var o2_damage = 10


func _ready():
	self.connect("area_entered",self,"on_area_entered")
	self.connect("body_entered",self,"on_area_entered")
	add_to_group("bullets")
			
			
func _process(delta):
	
	global_transform.origin += velocity * delta
	
func on_area_entered(object):
	
	var my_groups = get_groups()
	var collider_groupd = object.get_groups()
	
	var groups_intersect = false
	
	if object.is_in_group("destructable_objects"):
		object.hp -= damage
	
	for my_g in my_groups:
		if my_g != "idle_process" and collider_groupd.has(my_g):
			groups_intersect = true
			break
	
	if not groups_intersect and (collider_groupd.has("Player1") or collider_groupd.has("Player2")):
			
			var players = get_node("/root/MainNode/Players")

			var player
			if collider_groupd.has("Player1"):
				player = players.get_node("Player1")
			else:
				player = players.get_node("Player2")
				
			var playerSpatial = player.get_node("Spatial")
			if playerSpatial.state != playerSpatial.STATE.FAINT:
				playerSpatial.level_o2 -= o2_damage
			
	if not groups_intersect:				
		queue_free()