extends MeshInstance

enum TYPE{
	GASS,
	MACHINE_PART
}

var type 

func _ready():
	type = TYPE.MACHINE_PART


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
