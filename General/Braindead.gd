extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if velocity:
		velocity.x = move_toward(velocity.x,0,0.1)
		velocity.y = move_toward(velocity.y,0,0.1)
	move_and_slide()
