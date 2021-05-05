extends Spatial

#Animation state variables
var winking_left = false
var winking_right = false
var talking = false

#Node variables
onready var animation_tree = $AnimationTree
onready var animation_player = $AnimationPlayer

func _ready():
	set_process_unhandled_key_input(true)

func update_animation():
	
	var winking_left_speed = 1 if winking_left else 0
	animation_tree.set("parameters/TimeScale/scale", winking_left_speed)
	
	if winking_right:
		#Trigger the right eye and reset flag
		winking_right = false
		animation_tree.set("parameters/Seek/seek_position", 0)
	
	var talking_speed = 1 if talking else 0
	animation_tree.set("parameters/TimeScale 2/scale", talking_speed)

func _unhandled_key_input(event):
	#Toggle based on input
	if event.is_action_pressed("left"):
		winking_left = !winking_left
	elif event.is_action_pressed("right"):
		winking_right = !winking_right
	elif event.is_action_pressed("talk"):
		talking = !talking
	
	update_animation()
