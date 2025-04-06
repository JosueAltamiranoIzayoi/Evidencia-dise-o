extends Node2D

#Si el jugador toca la bandera pasa de nivel y reinicia sus vidas
func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print(body.get_name())
		GameManager.die()
		GameManager.pass_level()
	pass
