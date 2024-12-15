extends Control

@onready var master_audio_volume_db:float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	master_audio_volume_db = AudioServer.get_bus_volume_db(0)

func _on_disconnect_pressed() -> void:
	#disconnect from current lobby
	pass # Replace with function body.

func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)

func _on_sound_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,master_audio_volume_db*value)
