extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var needed_elements = ["fuel", "machinery", "chip", "nut", "screwdriver", "ducktape"]

var launch_counter = 0

var max_counter = 3

var is_ready = false

func _ready():
	self.connect("area_entered",self,"on_area_entered")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func on_area_entered(object):
	#change sprite to collectible
	if (object.is_in_group("Player1") or object.is_in_group("Player2")) and not object.is_in_group("bullets"):
		if object.get_parent().get_parent().get_parent().get_node("Spatial").state != object.get_parent().get_parent().get_parent().get_node("Spatial").STATE.FAINT:
			var debug_inv = object.inventory
			var i = 0
			while i < object.inventory.size():
				#if needed_elements.has(object.inventory[i]):
				#	launch_counter = launch_counter + 1
				launch_counter = launch_counter + 1
				i += 1
					
			if launch_counter >= max_counter:
				max_counter = needed_elements.size() - launch_counter
				
				var buffer = []
				i = 0
				while i < object.inventory.size():
					if needed_elements.has(object.inventory[i]):
						needed_elements.erase(object.inventory[i])
						buffer.push_back(object.inventory[i])
						i += 1
				
				i = 0
				while i < buffer.size():
					object.inventory.erase(buffer[i])
					i += 1
				
			launch_counter = 0
				
			if needed_elements.empty():
				is_ready = true
				get_tree().change_scene("res://intro/IntroScene.tscn")