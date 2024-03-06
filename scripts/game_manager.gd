extends Node3D

@onready var pause_menu := $'Pause Menu'

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed('pause'):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		pause_menu.show()
