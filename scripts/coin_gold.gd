extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("adicionar_moeda"):
		body.adicionar_moeda()
	print("o player colidiu")
	queue_free()
