extends Node

@onready var ok_button := $"VBoxContainer2/Button"

# Called when the node enters the scene tree for the first time.
func _ready():
	ok_button.connect('pressed', _back_to_main)

func _back_to_main():
	get_tree().change_scene_to_file('res://scenes/main_menu.tscn')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
