extends MeshInstance

enum TYPE{
	GASS,
	MACHINE_PART
}

var type 

func _ready():
	type = TYPE.MACHINE_PART
