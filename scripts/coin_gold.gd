extends Area3D

func _on_body_entered(body: Node3D) -> void:
	print("o player colidiu")
	$AnimationPlayer.play("collect")
	queue_free()
