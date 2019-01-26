extends Area

var hp = 3


func _ready():
	self.connect("area_entered",self,"on_area_entered")
	add_to_group("destructable_objects")

func _process(delta):
		
	if hp <= 0:
		var parent =  get_parent()
		var root = parent.get_parent()
		root.remove_child(parent)
		parent.call_deferred("free")
		

func on_area_entered(object):
	var groups = object.get_groups()
	if object.is_in_group("bullets"):
		hp = hp - object.damage