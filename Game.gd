extends Node2D


func _ready():
	var _error
	_error = $Layer/Back.connect("gui_input", self, "_on_TextureRect_gui_input")
	
	for child in $Layer/Bodies.get_children():
		_error = child.connect("mouse_entered", self, "_on_KinematicBody2D_mouse_entered", [child])
		_error = child.connect("mouse_exited", self, "_on_KinematicBody2D_mouse_exited", [child])


func _on_TextureRect_gui_input(event):
	$Layer/Back.self_modulate = Color.red

func _on_KinematicBody2D_mouse_entered(body):
	$Layer/Back.self_modulate = Color.white
	body.modulate = Color.red

func _on_KinematicBody2D_mouse_exited(body):
	body.modulate = Color.white
