extends Node2D

func _ready():
	multiplayer.peer_connected.connect(MultiplayerManager.add_player)
	MultiplayerManager.add_player()
