extends Node

onready var timer = get_node("Timer")
onready var timer_text = get_node("TimerText")
var is_timeout = false
var timer_text_begin = "Time left: "

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	var time_left = int(timer.get_time_left())
	var mins = time_left / 60
	var secs = time_left % 60
	
	timer_text.set_text(timer_text_begin + str(mins) + ":" + str(secs))
	pass


func _on_Timer_timeout():
	is_timeout = true
	timer.stop()
