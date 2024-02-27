extends CharacterBody3D

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var move_speed: float = 5.0
@export var jump_force: float = 5.0

func _physics_process(delta: float) -> void:
	velocity.y += -gravity * delta
	var dir := Input.get_vector('move_backward', 'move_forward', 'move_left', 'move_right')
	print(dir)
	move_and_slide()
