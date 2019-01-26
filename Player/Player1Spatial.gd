extends Spatial

var level_o2 = 0.0
var START_LVL_O2 = 20.0
var ACCELERATED_SPEED = 10
var ACCELERATING_O2_CHANGING_RATE = 0.5
var NORMAL_O2_CHANGING_RATE = 0.2
var level_o2_changing_rate = 0.0
var not_moving = true
var state = STATE.NORMAL

var timer_o2 = Timer.new()
var timer_acceleration = Timer.new()

var inventory = []

enum STATE{
	FAINT,
	NORMAL
}

func set_state(new_state):
	if state != new_state:
		state = new_state

func _ready():
	timer_o2.set_wait_time(0.3)
	timer_acceleration.set_wait_time(2.0)
	timer_o2.connect("timeout",self,"_on_timer_o2_timeout")
	timer_acceleration.connect("timeout",self,"_on_timer_acceleration_timeout")
	add_child(timer_o2)
	add_child(timer_acceleration)
	level_o2 = START_LVL_O2
	level_o2_changing_rate = NORMAL_O2_CHANGING_RATE


func _process(delta):
	if level_o2 <= 0.0:
		set_state(STATE.FAINT)

	if level_o2 < START_LVL_O2 and (not_moving or state == STATE.FAINT):
		level_o2 += level_o2_changing_rate
		if level_o2 >= START_LVL_O2:
			level_o2 = START_LVL_O2
			set_state(STATE.NORMAL)


func _input(event):
	if (InputMap.event_is_action(event, "move_left")
	or InputMap.event_is_action(event,"move_right")
	or InputMap.event_is_action(event,"move_down")
	or InputMap.event_is_action(event,"move_up")
	and state == STATE.NORMAL):
		level_o2 -= level_o2_changing_rate
		not_moving = false
		timer_o2.start()
	if (InputMap.event_is_action(event, "accelerate") and level_o2 == START_LVL_O2):
		get_parent().speed = ACCELERATED_SPEED
		level_o2_changing_rate = ACCELERATING_O2_CHANGING_RATE
		timer_acceleration.start()


func _on_timer_o2_timeout():
	not_moving = true

func _on_timer_acceleration_timeout():
	level_o2_changing_rate = NORMAL_O2_CHANGING_RATE
	get_parent().speed = get_parent().INITIAL_SPEED
