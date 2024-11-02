extends Node2D

var player_scene : PackedScene = preload("res://Scenes/player.tscn")

func _ready():
	if multiplayer.is_server():
		multiplayer.peer_connected.connect(add_player)
		add_player()
	
func add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)
