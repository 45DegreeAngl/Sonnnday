extends Node2D

var total_weapons : int = 0
var cur_active_weapon_indx : int = -1
@export var weapons_array :Array[Weapon] = []
@export var char : CharacterBody2D
var knockback_dir:Vector2
@onready var atk_dir: RayCast2D = $atk_dir


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	total_weapons = get_child_count()
	for child in get_children():
		if child is Area2D:
			if cur_active_weapon_indx<0:
				cur_active_weapon_indx = child.get_index()
			child.monitoring = false

##re enable the selected weapon
func change_weapon(index):
	cur_active_weapon_indx = index
	var temp_child = get_child(cur_active_weapon_indx)
	if temp_child is Area2D:
		temp_child.monitoring = true

##deal the damage to the other player
func _on_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		var atk:Attack = weapons_array[cur_active_weapon_indx].atk
		
		atk.knockback_direction_2d = atk_dir.target_position.normalized() + atk.knockback_direction_2d
		
		area.damage(atk)

##updates the atk vector to where the cur player stick is moving (from a mystical place that gabe mentioned)
func update_atk_vector(balls:Vector2):
	atk_dir.target_position = balls
	rotation = balls.angle()
