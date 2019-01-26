extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.set_wait_time(30)
	self.connect("timeout",self,"_on_timeout")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_timeout():
	#get_tree().change_scene("res://GameplayScene.tscn")
	pass
