extends CharacterBody3D

@export var speed: float
@export var jump_velocity: float
@export var gravity: float

func _physics_process(delta):
	var movement_vector = get_movement_vector()
	
	change_velocity(movement_vector, delta)
	set_floor_snap_length(0.2) # "prender" o player no chao quando estiver a x unidades de distancia do chao
	move_and_slide()
	
func get_movement_vector():
	var movement_vector = Vector3.ZERO
	
	movement_vector.z = Input.get_action_strength("left") - Input.get_action_strength("right")
	movement_vector.x = Input.get_action_strength("backwards") - Input.get_action_strength("forward")
	
	return movement_vector.normalized()
	
func change_velocity(movement_vector: Vector3, delta):
	# mudar a velocidade
	velocity.x = movement_vector.x * speed
	velocity.z = movement_vector.z * speed
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_velocity
			
	# girar o player
	if movement_vector != Vector3.ZERO:
		var look_direction = Vector3(movement_vector.x, 0, movement_vector.z)
		look_at(global_transform.origin + look_direction, Vector3.UP) 
		
		# TODO: smooth linear interpolation pra deixar a rotacao mais natural
		
		#var target_rotation = Quaternion(Transform3D().looking_at(look_direction, Vector3.UP).basis)
		#var smooth_rotation = Quaternion(basis).slerp(target_rotation, delta * 5.0)
		#
		#global_transform.basis = Basis(smooth_rotation)
		
var moedas_coletadas: int = 0

func adicionar_moeda(valor: int = 1):
	moedas_coletadas += valor
	print("moedas: %d" % moedas_coletadas)
	
	var hud = get_tree().get_current_scene().get_node("HUD")
	hud.atualizar_moedas(moedas_coletadas)
	
