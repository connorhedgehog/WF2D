extends Control

@onready var line_edit: LineEdit = $Panel/LineEdit

func _on_send_pressed() -> void:
	get_node("../Label").text = line_edit.text
