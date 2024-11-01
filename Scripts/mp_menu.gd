extends Control

func _on_host_pressed():
	MultiplayerManager.host()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_join_pressed():
	MultiplayerManager.join()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
