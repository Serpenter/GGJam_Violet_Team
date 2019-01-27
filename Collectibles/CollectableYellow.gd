extends Area

var  loot

func _ready():
	self.connect("area_entered",self,"on_area_entered")
	loot = "chip"


func _process(delta):
	pass

	
func on_area_entered(object):
	#change sprite to collectible
	if (object.is_in_group("Player1") or object.is_in_group("Player2")) and not object.is_in_group("bullets"):
		if object.get_parent().get_parent().get_parent().get_node("Spatial").state != object.get_parent().get_parent().get_parent().get_node("Spatial").STATE.FAINT:
			object.inventory.push_back(loot)
			var playerNumber
			if (object.is_in_group("Player1")):
				playerNumber = 1
			else:
				playerNumber = 2
				
			var playerUI = get_node("/root/MainNode/UI/PlayerUI")
			playerUI.item_collected(playerNumber)
			get_parent().queue_free()
		