extends Resource

class_name Weapon

@export var wep_name:String
@export var dmg_stat:float
@export var knck_stat:float
var atk:Attack

func _ready()->void:
	atk = Attack.new()
	atk.attack_damage = dmg_stat
	atk.knockback_force = knck_stat
