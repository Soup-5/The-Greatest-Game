extends Control

@onready var start_button := $"VBoxContainer/Start"
@onready var start_button_2 := $"VBoxContainer/Start (but cool)"
@onready var stop_button := $"VBoxContainer/Stop"
@onready var settings_button_1 := $"VBoxContainer/Settings1"
@onready var settings_button_2 := $"VBoxContainer/Settings2"
@onready var settings_button_3 := $"VBoxContainer/Settings3"
var rng = RandomNumberGenerator.new()
var actual_settings = rng.randi_range(1,3)

func _ready() -> void:
	start_button.connect('pressed', _on_start_game)
	start_button_2.connect('pressed', _on_start_game)
	stop_button.connect('pressed', _close_game)
	if actual_settings == 1:
		settings_button_1.connect('pressed', _open_settings)
		settings_button_2.connect('pressed', _fake_settings)
		settings_button_3.connect('pressed', _fake_settings)
	
	elif actual_settings == 2:
		settings_button_1.connect('pressed', _fake_settings)
		settings_button_2.connect('pressed', _open_settings)
		settings_button_3.connect('pressed', _fake_settings)
	
	elif actual_settings == 3:
		settings_button_1.connect('pressed', _fake_settings)
		settings_button_2.connect('pressed', _fake_settings)
		settings_button_3.connect('pressed', _open_settings)
	

func _on_start_game() -> void:
	get_tree().change_scene_to_file('res://scenes/game.tscn')

func _close_game() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

func _open_settings() -> void:
	get_tree().change_scene_to_file('res://scenes/settings.tscn')

func _fake_settings() -> void:
	get_tree().change_scene_to_file('res://scenes/fake_settings.tscn')
