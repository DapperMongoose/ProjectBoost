extends RigidBody3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * 1000)
		
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, 100.0 * delta))
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -100.0 * delta))


func _on_body_entered(body: Node) -> void:
	if "Goal" in body.get_groups():
		print("You win!")
	if "Hazard" in body.get_groups():
		print("You lose")
