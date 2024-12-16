extends Node2D

var total_weapons : int = 0
var cur_active_weapon_indx : int = -1
@export var weapons_array :Array[Weapon] = []
@export var char : CharacterBody2D
var knockback_dir:Vector2
@onready var atk_dir: RayCast2D = $atk_dir
@onready var cooldown: Timer = $Cooldown
@onready var attack_frames: Timer = $AttackFrames

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	total_weapons = get_child_count()
	for child in get_children():
		if child is Area2D:
			if cur_active_weapon_indx<0:
				cur_active_weapon_indx = child.get_index()
			child.monitoring = false
			child.area_entered.connect(_on_victim_entered)

##re enable the selected weapon
func change_weapon(index):
	cur_active_weapon_indx = index
	cooldown.wait_time = weapons_array[cur_active_weapon_indx].cool_stat

##deal the damage to the other player
func _on_victim_entered(area: Area2D) -> void:
	
	if area.has_method("damage"):
		var atk:Attack = Attack.new()
		var wep:Weapon = weapons_array[cur_active_weapon_indx]
		atk.attack_damage = wep.dmg_stat
		atk.knockback_force = wep.knck_stat
		atk.knockback_direction_2d = wep.knockback_dir
		atk.knockback_direction_2d = atk_dir.target_position.normalized() + atk.knockback_direction_2d
		
		area.damage(atk)

##updates the atk vector to where the cur player stick is moving (from a mystical place that gabe mentioned)
func update_atk_vector(balls:Vector2):
	atk_dir.target_position = balls
	rotation = balls.angle()

func attack():
	if !cooldown.is_stopped():
		print("I cannot attack")
		return
	print("ATTACK")
	var temp_child = get_child(cur_active_weapon_indx)
	if temp_child is Area2D:
		temp_child.monitoring = true
		cooldown.start()
		attack_frames.start()

func _on_cooldown_timeout() -> void:
	var temp_child = get_child(cur_active_weapon_indx)
	if temp_child is Area2D:
		temp_child.monitoring = true

func _on_attack_frames_timeout() -> void:
	var temp_child = get_child(cur_active_weapon_indx)
	if temp_child is Area2D:
		temp_child.monitoring = false
