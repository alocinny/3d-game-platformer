extends Area3D

@export var valor: int =1

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("adicionar_moeda"):
		body.adicionar_moeda(valor)
		
	print("o player colidiu")
	$AnimationPlayer.play("collect")
	queue_free()
