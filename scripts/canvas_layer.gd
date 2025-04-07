extends CanvasLayer

@onready var label_moedas = $LabelMoedas

func atualizar_moedas(nova_quantidade: int):
	label_moedas.text = "Moedas: %d" % nova_quantidade
