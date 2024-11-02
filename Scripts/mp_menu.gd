extends Control

var peer = ENetMultiplayerPeer.new()

func _on_host_pressed():
	peer.create_server(8008)
	multiplayer.multiplayer_peer = peer
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_join_pressed():
	peer.create_client("localhost", 8008)
	multiplayer.multiplayer_peer = peer
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
