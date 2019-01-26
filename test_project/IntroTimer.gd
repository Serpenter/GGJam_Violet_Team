extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
#	wait_time = 3
#	start()

func _process(delta):

	if is_stopped():
		get_tree().change_scene("res://test_playground.tscn")
