extends Area3D

@onready var player = %Player
@onready var respawnPoint =  get_parent().get_node("respawnPoint")

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		kill()
		
func kill():
	player.position = respawnPoint.position
