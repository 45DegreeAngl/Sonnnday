extends Node
class_name Health

@export var max_health := 100.0
var health : float
var invuln : bool

func _ready():
	invuln = false
	health = max_health

func damage(attack : Attack):
	if invuln == false:
		health -= abs(attack.attack_damage)
		
		if health <= 0:
			die()

func direct_damage(dmg:float):
	if invuln == false:
		health -= abs(dmg)
		
		if health <= 0:
			die()

func die():
#	implement component based death behaviors :D
	get_parent().queue_free()
