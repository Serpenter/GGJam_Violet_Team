extends Spatial

onready var area = get_node("MeshInstance/Area")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func get_player_1_hide():
	return area.is_player_1_hide
	
func get_player_2_hide():
	return area.is_player_2_hide
