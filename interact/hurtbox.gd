extends Area2D
class_name Hurtbox

@export var health_component : Health
@export var knockback_component : Knockback
@export var player : CharacterBody2D
@export var hazard_delay_timer : Timer
var hazardmap

func _ready() -> void:
	self.body_entered.connect(hurtbox_body_entered)

func hazard_damage():
	var map_pos = hazardmap.local_to_map(hazardmap.to_local(global_position))
	print(hazardmap.get_cell_tile_data(map_pos).get_custom_data("damage"))
	health_component.direct_damage(health_component.max_health * hazardmap.get_cell_tile_data(map_pos).get_custom_data("damage"))
	hazard_delay_timer.start()

func hurtbox_body_entered(body):
	#checks if intersecting any hazard elements on the tilemap and updates the hazardmap node
	if body.is_in_group("Map"):
		hazardmap = body
		if hazard_delay_timer.time_left == 0:
			hazard_delay_timer.start()

func damage(attack:Attack):
	if health_component:
		health_component.damage(attack)
	if knockback_component:
		knockback_component.deal_knockback(attack)


func _on_hazard_delay_timer_timeout() -> void:
	if overlaps_body(hazardmap):
		hazard_damage()
