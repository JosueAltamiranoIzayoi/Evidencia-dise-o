extends Control


func _ready() -> void:
	$VBoxContainer/Start.grab_focus()

func _process(delta: float) -> void:
	pass
#Iniciar juego
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mundo.tscn")
#Salir
func _on_quit_pressed() -> void:
	get_tree().quit()
