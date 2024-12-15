extends Node
class_name Knockback

@export var entity : Node

@export_range(0,1) var susceptibility : float = 1
func deal_knockback(attack : Attack):
	if !entity.has_method("get_velocity"):
		return
	if attack.knockback_direction_2d:
		entity.velocity += attack.knockback_direction_2d*attack.knockback_force*susceptibility
		return
	if attack.knockback_direction_3d:
		entity.velocity += attack.knockback_direction_3d*attack.knockback_force*susceptibility
		return
