extends CanvasLayer

@onready var tape_counter: MarginContainer = $'Tape Counter'
@onready var inventory: MarginContainer = $Inventory
@onready var flashlight_charge: MarginContainer = $'Flashlight Charge'
@onready var status_msg: MarginContainer = $'Status Popup'

@export var player: Player

func _ready() -> void:
	## set visibilities
	flashlight_charge.hide()
	status_msg.hide()
