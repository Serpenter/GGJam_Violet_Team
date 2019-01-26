extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.connect("area_entered",self,"on_collectible_area_entered")


func _process(delta):
	pass
	
func on_collectible_area_entered(object):
	#change sprite to collectible
	var node = get_node("../../Player2/Spatial")
	var collectible_instance = get_parent()
	node.emit_signal("get_collectible", collectible_instance)
	
	var parent = get_parent()
	var root = parent.get_parent()
	root.remove_child(parent)
	