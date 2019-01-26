extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var hp = 3

signal custom_area_entered

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#self.connect("custom_area_entered",self,"on_custom_ares_entered")
	#self.connect("area_entered",self,"on_custom_area_entered")
	self.connect("area_entered",self,"on_custom_area_entered")
	pass

func _process(delta):
	
#	var player1 = get_node("Player1")
#	var player2 = get_node("Player2")
	
		
	if hp == 0:
		var parent =  get_parent()
		var root = parent.get_parent()
		root.remove_child(parent)
		parent.call_deferred("free")
		

func on_custom_area_entered(object):
	
	#var player1 = get_node("Player1").get_node("Area")
	#var player2 = get_node("Player2").get_node("Area")
	
	#if object==player1 and object==player2:
	hp = hp - 1