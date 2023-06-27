extends RigidBody2D


func _input(event) -> void:
	# Applying a central impulse to all bodies:
	if event.is_action_pressed("ui_down"):
		apply_central_impulse(Vector2(0, 900))
