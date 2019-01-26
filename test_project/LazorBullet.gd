extends Area

var velocity = Vector3()
var speed = 2

var damage = 3
var o2_damage = 0


func _ready():
	self.connect("area_entered",self,"on_area_entered")
	self.connect("body_entered",self,"on_area_entered")
	add_to_group("bullets")
			
			
func _process(delta):
	
	var a = global_transform.origin
	global_transform.origin += velocity * delta
	var b = global_transform.origin
	var c
	
func on_area_entered(object):
	
	var my_groups = get_groups()
	var collider_groupd = object.get_groups()
	
	var groups_intersect = false
	
	if object.is_in_group("destructable_objects"):
		object.hp -= damage
	
	for my_g in my_groups:
		if collider_groupd.has(my_g):
			groups_intersect = true
			break
			
			
	if not groups_intersect:				
		queue_free()