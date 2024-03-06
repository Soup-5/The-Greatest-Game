extends CanvasLayer

@onready var back_to_game_button := $MarginContainer/VBoxContainer/Resume
@onready var main_menu_button := $MarginContainer/VBoxContainer/Exit

func _ready() -> void:
	back_to_game_button.connect('pressed', return_to_game)
	main_menu_button.connect('pressed', return_to_main_menu)
	hide()

func return_to_game() -> void:
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false

func return_to_main_menu() -> void:
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file('res://scenes/main_menu.tscn')
