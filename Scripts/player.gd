extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer
@export var knockbackPower: int = 5000
	
var moveSpeed = 100.0
var moveSpeedN = 100.0
const maxSpeed = 500.0
const Jump_height = -300.0
const up = Vector2(0,-1)
const gravity = 15.0

var motion = Vector2()

func _physics_process(delta: float) -> void:
	#Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	#Saltos
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = Jump_height
		
	#Movimientos
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction && Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		velocity.x = direction * moveSpeed
	
	#Animaciones
	elif direction && Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		velocity.x = direction * moveSpeed
		
	else:
		animationPlayer.play("Idle")
		velocity.x = move_toward(velocity.x, 0, moveSpeed)
	move_and_slide()
	
#Daño por pinchos
func _on_spikes_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		moveSpeed = -5
		await get_tree().create_timer(0.5).timeout
		moveSpeed = 100
		GameManager.minus_score()
		GameManager.die()

#Manejar muros invisibles
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().reload_current_scene()
