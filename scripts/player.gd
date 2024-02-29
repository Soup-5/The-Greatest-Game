extends CharacterBody3D

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var move_speed: float = 5.0
@export var jump_force: float = 5.0

var dir: Vector2

func _physics_process(delta: float) -> void:
	velocity.y += -gravity * delta
	dir = Input.get_vector('move_left', 'move_right', 'move_forward', 'move_backward')
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = jump_force
	velocity.x = dir.x * move_speed
	velocity.z = dir.y * move_speed
	move_and_slide()
