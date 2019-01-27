extends Spatial

var level_o2 = 0.0
var START_LVL_O2 = 20.0
var ACCELERATED_SPEED = 10
var ACCELERATING_O2_CHANGING_RATE = 0.5
var min_o2_for_accelerating = START_LVL_O2 * 0.25
var NORMAL_O2_CHANGING_RATE = 0.2
var level_o2_changing_rate = 0.0
var level_o2_still_regen_rate = 0.3
var level_o2_moving_regen_rate = 0.22
var not_moving = true
var state = STATE.NORMAL
var o2_for_shot = 5
var min_o2_for_shooting = START_LVL_O2 / 2

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
		level_o2 += level_o2_still_regen_rate
		if level_o2 >= START_LVL_O2:
			level_o2 = START_LVL_O2
			set_state(STATE.NORMAL)
	elif not not_moving:
		#level_o2 += level_o2_moving_regen_rate
		pass


func _input(event):
	if (InputMap.event_is_action(event, "move_left_p2")
	or InputMap.event_is_action(event,"move_right_p2")
	or InputMap.event_is_action(event,"move_down_p2")
	or InputMap.event_is_action(event,"move_up_p2")
	and state == STATE.NORMAL):
		level_o2 -= level_o2_changing_rate
		not_moving = false
		timer_o2.start()
	if (InputMap.event_is_action(event, "accelerate_p2") and level_o2 >= min_o2_for_accelerating):
		get_parent().speed = ACCELERATED_SPEED
		level_o2_changing_rate = ACCELERATING_O2_CHANGING_RATE
		timer_acceleration.start()


func _on_timer_o2_timeout():
	not_moving = true

func _on_timer_acceleration_timeout():
	level_o2_changing_rate = NORMAL_O2_CHANGING_RATE
	get_parent().speed = get_parent().INITIAL_SPEED
	
	
func can_fire():
	return level_o2 > min_o2_for_shooting
	
func decrease_o2_from_firing():
	level_o2 -= o2_for_shot
