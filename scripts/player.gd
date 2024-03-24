extends CharacterBody3D

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var head: Node3D = $Head
@onready var hand: Node3D = $Head/Hand
@onready var pickup_range: RayCast3D = $Head/RayCast3D

@export var move_speed: float = 5.0
@export_range(0.0, 1.0) var acceleration: float = 0.1
@export_range(0.0, 1.0) var frictional_inertia: float = 0.1
@export var jump_force: float = 5.0
@export var mouse_sense: float = 1.0

var dir: Vector3
var inventory: Array[Item]

func _physics_process(delta: float) -> void:
	velocity.y += -gravity * delta
	var input := Input.get_vector('move_left', 'move_right', 'move_forward', 'move_backward')
	dir = transform.basis * Vector3(input.x, 0, input.y)
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = jump_force
	if dir.x != 0.0:
		velocity.x = lerp(velocity.x, dir.x * move_speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, frictional_inertia)
	if dir.z != 0.0:
		velocity.z = lerp(velocity.z, dir.z * move_speed, acceleration)
	else:
		velocity.z = lerp(velocity.z, 0.0, frictional_inertia)
	move_and_slide()
	if pickup_range.is_colliding() and pickup_range.get_collider() is Item:
		print(pickup_range.get_collider())
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sense * 0.001)
		head.rotate_x(-event.relative.y * mouse_sense * 0.001)
		head.rotation.x = clampf(head.rotation.x, -deg_to_rad(70), deg_to_rad(70))
