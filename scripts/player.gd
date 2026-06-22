extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_power_bar: ProgressBar = $power_bar/jump_power_bar

var JUMP_VELOCITY = 0
var JUMP_POWER = 0
const power_speed = 450

func _physics_process(delta: float) -> void:
	
	jump_power_bar.value = abs(JUMP_VELOCITY)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.frame = 4
	
	if is_on_floor():
		velocity.x = 0
		animated_sprite_2d.play("landed")

	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		
		JUMP_POWER += power_speed * delta
		JUMP_POWER = min(JUMP_POWER, 180)
		
		JUMP_VELOCITY -= power_speed * delta
		JUMP_VELOCITY = min(JUMP_VELOCITY, 750)
		
	if Input.is_action_just_released("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		velocity.x = JUMP_POWER
		animated_sprite_2d.play("jump")
		JUMP_VELOCITY = 0
		JUMP_POWER = 0
		
	move_and_slide()
	
