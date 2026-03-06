extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var tile_size: int = 32
@export var speed: int = 200

var moving: bool = false
var target_pos: Vector2

func _ready() -> void:
	target_pos = global_position
	
func _process(delta: float) -> void:
	if moving:
		global_position = global_position.move_toward(target_pos, speed * delta)
		
		if global_position == target_pos:
			moving = false
			
		return
		
	var direction = Vector2.ZERO
	
	if Input.is_action_just_pressed("ui_left"):
		direction = Vector2.UP
	elif Input.is_action_just_pressed("ui_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2.DOWN
	
	if direction != Vector2.ZERO:
		move(direction)
		
func move(direction: Vector2) -> void:
	target_pos = global_position + direction * tile_size
	moving = true
