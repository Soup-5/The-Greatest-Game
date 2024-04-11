extends CanvasLayer

@onready var tape_counter: = $'Tape Counter/HBoxContainer/Count'
@onready var inventory: = [
	$'Inventory/HBoxContainer/Panel/Slot 1',
	$'Inventory/HBoxContainer/Panel2/Slot 2',
	$'Inventory/HBoxContainer/Panel3/Slot 3'
]
@onready var flashlight_charge: = $'Flashlight Charge/Charge Progress'
@onready var status_msg: = $'Status Popup/HBoxContainer/Label'

@export var player: Player

func _ready() -> void:
	# set visibilities
	flashlight_charge.hide()
	status_msg.hide()
	
	# connect signals


