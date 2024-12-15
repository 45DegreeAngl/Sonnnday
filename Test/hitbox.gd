extends Area2D

@export var dmg:float = 10
@export var knockback_dir:Vector2 = Vector2.ZERO
@export var knockback_force:float = 1

func _on_area_entered(area: Area2D) -> void:
	##this should be an rpc function
	if area.has_method("damage"):
		var atk:Attack = Attack.new()
		atk.attack_damage = dmg
		atk.knockback_direction_2d = knockback_dir
		atk.knockback_force = knockback_force
		area.damage(atk)
