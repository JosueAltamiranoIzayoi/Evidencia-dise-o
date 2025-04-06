extends Node2D

var score = 0
var flagL = 0
var mundo = 1
var lifes = 5

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass
	
#Añadir puntos
func add_score():
	score += 1
	
#Quitar/resetear puntos
func minus_score():
	score = score - 1
	if score <= 0:
		score = 0
	
#Avanzar de nivel
func pass_level():
	mundo += 1
	if mundo == 3:
		lifes = 0
	#Terminar juego
	if mundo > 4:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	get_tree().change_scene_to_file("res://Scenes/mundo" + str(mundo) + ".tscn") ##mundo se convierte a string para seleccionar el archivo
	score = 0
	
##Quitar vidas
func loseLife():
	lifes = lifes - 1
	
#Quitar vidas con el boss
func loseLifeX():
	lifes = lifes - 5
	
func die():
	lifes = 5
