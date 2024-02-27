extends Control

@onready var start_button := $VBoxContainer/Start

func _ready() -> void:
	start_button.connect('pressed', _on_start_game)

func _on_start_game() -> void:
	get_tree().change_scene_to_file('res://scenes/game.tscn')
