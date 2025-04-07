extends CanvasLayer

@onready var label_moedas = $HBoxContainer/LabelMoedas

func atualizar_moedas(nova_quantidade: int):
	label_moedas.text = "%d" % nova_quantidade
