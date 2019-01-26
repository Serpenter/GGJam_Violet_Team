extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.connect("area_entered",self,"on_area_entered")
	pass

func on_area_entered(object):
	
	if object.is_in_group("collectable_items"):
		
		print("Player collected some shit")
		var playerSpatial = get_parent().get_node("Spatial")
		playerSpatial.inventory.append(object)
		
	elif object.is_in_group("bullets"):
		
		print("Player was hit by a fucking bullet")
		var playerSpatial = get_parent().get_node("Spatial")
		playerSpatial.level_o2 =- object.o2_damage