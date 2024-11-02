extends Node

var peer = ENetMultiplayerPeer.new()
var player_scene : PackedScene = preload("res://Scenes/player.tscn")

func host():
	peer.create_server(8008)
	multiplayer.multiplayer_peer = peer

func join():
	peer.create_client("localhost", 8008)
	multiplayer.multiplayer_peer = peer
	
func add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)
