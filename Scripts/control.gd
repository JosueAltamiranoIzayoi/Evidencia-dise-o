extends Control

@onready var bananaLabel = $bananaLabel
@onready var hearthLaber = $hearthLabel

func _ready() -> void:
	pass


#Modificar las gemas y vidas en la UI
func _process(delta: float) -> void:
	bananaLabel.text = ": %d" % GameManager.score
	hearthLaber.text = ": %d" % GameManager.lifes
