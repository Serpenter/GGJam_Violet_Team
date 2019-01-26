extends Area

func _ready():
	self.connect("area_entered",self,"on_area_entered")


func _process(delta):
	var a = 1
	pass


func remove_from_tree():
	get_parent().get_parent().remove_child(get_parent())

	
func on_area_entered(object):
	#change sprite to collectible
	if (object.is_in_group("Player1") or object.is_in_group("Player2")) and not object.is_in_group("bullets"):
		var playerSpatial = object.get_parent().get_node("Spatial")
		playerSpatial.inventory.append(self)
		remove_from_tree()
		pass
	