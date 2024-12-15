extends Node
class_name Hurtbox

@export var health_component : Health
@export var knockback_component : Knockback

func damage(attack:Attack):
	if health_component:
		health_component.damage(attack)
	if knockback_component:
		knockback_component.deal_knockback(attack)
