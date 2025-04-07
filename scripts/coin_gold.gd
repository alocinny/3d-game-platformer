extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("adicionar_moeda"):
		$AudioStreamPlayer3D.play()
		body.adicionar_moeda()
		await $AudioStreamPlayer3D.finished
		queue_free()
	print("o player colidiu")
