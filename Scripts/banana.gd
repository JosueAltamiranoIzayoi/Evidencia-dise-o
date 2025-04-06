extends Node2D

signal bananaCollected

#Recolectar gemas
func _on_banana_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		$Banana2D/AudioStreamPlayer.playing = true
		GameManager.add_score()
		await get_tree().create_timer(0.2).timeout
		queue_free()
		pass # Replace with function body.
