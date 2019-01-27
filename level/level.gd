extends Node

var is_game_over = false
onready var timer_instance = get_node("/root/MainNode/UI/TimerUI")
onready var game_over_layer = get_node("/root/MainNode/UI/GameOver")

func _ready():
	game_over_layer.hide()
	pass

func _process(delta):
	if timer_instance.is_timeout:
		is_game_over = true
		game_over_layer.show()
	pass
