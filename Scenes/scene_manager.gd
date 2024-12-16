extends Node2D

@export var scenes: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_scenes("menu")


func change_scenes(scene_name: String):
	var scene = scenes.get(scene_name)
	if scene:
		for child in get_children():
			remove_child(child)
		if(ResourceLoader.exists(scene)):
			var instance : Node = ResourceLoader.load(scene).instantiate()
			add_child(instance)
		else:
			push_warning("Error: Couldn't load scene from path " + scene)
	else:
		push_warning("Error: scene " + scene_name + " not found!")
