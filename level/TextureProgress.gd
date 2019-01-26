extends TextureProgress

func _ready():
 var node = get_node("../Spatial")
 max_value = node.START_LVL_O2
 min_value = 0
 set_process(true)

func _process(delta):
 var node = get_node("../Spatial")
 set_value(node.level_o2)
 print(value)