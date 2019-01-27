extends Node2D

var items_text = "Items to collect: "
onready var timer_text1 = get_node("Player1")
onready var timer_text2 = get_node("Player2")
var player_1_items_to_collect = 3
var player_2_items_to_collect = 3

func _ready():
	set_text(timer_text1, player_1_items_to_collect)
	set_text(timer_text2, player_2_items_to_collect)
	
func set_text(timer_text, value):
	timer_text.set_text(items_text + str(value))

func item_collected(player_number):
	if(player_number == 1):
		player_1_items_to_collect -= 1
		set_text(timer_text1, player_1_items_to_collect)
	else:
		player_2_items_to_collect -= 1
		set_text(timer_text2, player_2_items_to_collect)
		
func item_dropped(player_number):
	if(player_number == 1):
		player_1_items_to_collect += 1
		set_text(timer_text1, player_1_items_to_collect)
	else:
		player_2_items_to_collect += 1
		set_text(timer_text2, player_2_items_to_collect)
