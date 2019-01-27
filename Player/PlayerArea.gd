extends Area

var inventory = []

func _ready():
	self.connect("area_entered",self,"on_area_entered")
	
func process(delta):
	print(inventory)
	if inventory:
		pass

func on_area_entered(object):
	pass
