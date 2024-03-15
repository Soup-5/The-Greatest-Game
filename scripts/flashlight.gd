extends Node3D

@onready var light := $SpotLight3D
@export var max_charge: float = 100.0
@onready var charge := max_charge
var is_on: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if is_on:
		charge -= 1.0 * delta
	if Input.is_action_just_pressed('shoot'):
		light.visible = not light.visible
		is_on = not is_on
