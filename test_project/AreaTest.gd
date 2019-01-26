extends Area

var field

func _ready():
	self.connect("area_entered",self,"on_area_entered")
	field = 2

func _process(delta):
	field = 3
	

func on_area_entered(object):
	get_parent().queue_free()
