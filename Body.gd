extends KinematicBody2D


signal hover(event)


var _hover := false


func _input(event):
	$Collider.position = get_local_mouse_position()
	if $Collider.shape.collide($Collider.global_transform, $Shape.shape, $Shape.global_transform):
		get_tree().set_input_as_handled()
		
		if event is InputEventMouseMotion and not _hover:
			emit_signal("mouse_entered")
			_hover = true
			
		emit_signal("hover", event)
			
	else:
		if event is InputEventMouseMotion and _hover:
			emit_signal("mouse_exited")
			_hover = false
