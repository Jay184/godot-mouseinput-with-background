# godot-mouseinput-with-background

This repository demonstrates how one can listen to mouse events on a `PhysicsBody2D` when an underlying `Control`-Node also listens to `gui_input` Events.

### Problem:
According to the [Godot docs](https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html#how-does-it-work) `Control._input_event(ev)` triggers before `CollisionObject._input_event` and also consumes the event, stopping further propagation.

[![Event chain](https://docs.godotengine.org/en/stable/_images/input_event_flow.png)](https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html#how-does-it-work)


### Solution

As a game developer you don't care about the internals of an engine. So I present a ready-to-use solution to the issue, even if it is not the intended use of the constructs used to solve the issue.

The main magic happens by using `_input(ev)` instead of `CollisionObject._input_event` to make sure we process the event before the control, then if a shape (1 pixel radius) collides with the hitbox. The 1 pixel shape follows the mouse and thus represents the mouse pointer.

```gdscript
func _input(event):
  $Collider.position = get_local_mouse_position()
  if $Collider.shape.collide($Collider.global_transform, $Shape.shape, $Shape.global_transform):
		get_tree().set_input_as_handled()
		# Mouse is in the shape!
```
