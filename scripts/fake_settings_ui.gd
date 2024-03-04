extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var ok_button := $"VBoxContainer2/Button"
	ok_button.connect('pressed', _close_window)

func _close_window():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
