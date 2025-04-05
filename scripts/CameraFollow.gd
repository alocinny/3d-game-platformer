extends Camera3D

@export var offset := Vector3(0, 5, -10)
@export var follow_speed := 5.0

@onready var _player = %Player

func _process(delta):
	if _player:
		var player_pos = _player.global_transform.origin
		var current_pos = global_transform.origin
		var target_y = player_pos.y + offset.y
		var target_z = player_pos.z + offset.z
		var smoothed_y = lerp(current_pos.y, target_y, delta * follow_speed)
		var smoothed_z = lerp(current_pos.z, target_z, delta * follow_speed)

		global_transform.origin = Vector3(current_pos.x, smoothed_y, smoothed_z)
