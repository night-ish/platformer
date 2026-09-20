extends CharacterBody2D
class_name Namer


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const FALL_VELOCITY = 800.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	
	if direction and is_on_floor():
		velocity.x = direction * SPEED
		animated_sprite.play("Walk")
		animated_sprite.flip_h = direction > 0
		
	elif not is_on_floor():
		velocity.y += FALL_VELOCITY * delta / 2
		animated_sprite.play("Fall")
		if direction :
			velocity.x = direction * SPEED
			animated_sprite.play("Jump")
			animated_sprite.flip_h = direction > 0
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite.play("Idle")
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("Idle")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("Jump")
		
	move_and_slide()

func _ready() -> void:
	if Input.is_action_just_pressed("M"):
		get_tree().reload_current_scene()


func _on_end_t_timeout() -> void:
	set_physics_process(false)
