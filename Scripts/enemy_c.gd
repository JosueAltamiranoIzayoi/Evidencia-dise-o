extends CharacterBody2D

var gravity = 10
var speed = 26
var velocityE = Vector2(0,0)
var moving_Left = true
@onready var animationPlayer = $AnimationPlayer


func _ready() -> void:
	$AnimationPlayer.play("Idle")
	
func _process(delta: float) -> void:
	move_character()
	turn()
#Movimiento del boss
func move_character():
	velocity.y += gravity
	if(moving_Left):
		velocity.x = -speed
		velocityE = move_and_slide()
		
	else:
		velocity.x = speed
		velocityE = move_and_slide()

#Knockback del boss en caso de tener vidas
func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.get_name() == "Player":
		GameManager.minus_score()
		GameManager.loseLifeX()
		if GameManager.lifes < 0:
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
			GameManager.die()
		
#Darse la vuelta si no detecta suelo
func turn():
	if not $RayCast2D.is_colliding():
		moving_Left = !moving_Left
		scale.x = -scale.x
