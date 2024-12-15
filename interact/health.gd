extends Node
class_name Health

@export var max_health := 30.0
var health : float

func _ready():
	health = max_health

func damage(attack : Attack):
	health -= attack.attack_damage
	
	if health <= 0:
		die()

func direct_damage(dmg:float):
	health -= dmg
	
	if health <= 0:
		die()

func die():
#	implement component based death behaviors :D
	get_parent().queue_free()
