extends Control

#Que el menu no sea visible
func _ready() -> void:
	visible = false;
#Cuando pulsamos escape se activa el menu y se pausa el juego
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		visible = not get_tree().paused
		get_tree().paused = not get_tree().paused


func _process(delta: float) -> void:
	pass
