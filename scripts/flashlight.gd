extends Item

@onready var light: SpotLight3D = $SpotLight3D
@onready var charge: float = max_charge

@export var max_charge: float = 100.0
@export var depletion_rate: float = 1.0

var is_on: bool = false

func _process(delta: float) -> void:
	if is_on and charge > 0.0:
		light.visible = true
		charge -= depletion_rate * delta
		charge = clampf(charge, 0, charge)
	else:
		light.visible = false
	if Input.is_action_just_pressed('shoot'):
		is_on = not is_on
