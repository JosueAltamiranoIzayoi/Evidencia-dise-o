extends Area2D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

#Resetear el nivel si nos caemos del mapa
func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print(body.get_name())
		GameManager.minus_score()
		get_tree().reload_current_scene()
