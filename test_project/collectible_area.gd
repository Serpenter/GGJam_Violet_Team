extends Area

func _ready():
	self.connect("area_entered",self,"on_area_entered")


func _process(delta):
	var a = 1
	pass
	
	
func self_destroy():
		var parent =  get_parent()
		var root = parent.get_parent()
		root.remove_child(parent)
		parent.call_deferred("free")
	
func on_area_entered(object):
	#change sprite to collectible
	if object.is_in_group("Player1") or object.is_in_group("Player2"):
		#object.collect_this_collectible
		#might actually resolve it in player
		self_destroy()
		pass
	