extends Area

var inventory = []

func _ready():
	self.connect("area_entered",self,"on_area_entered")
	
func process(delta):
	print(inventory)

func on_area_entered(object):
		
	if object.is_in_group("bullets"):
		
		print("Player was hit by a fucking bullet")
		var playerSpatial = get_parent().get_node("Spatial")
		playerSpatial.level_o2 =- object.o2_damage
