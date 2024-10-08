class_name ClickableBody
extends StaticBody3D

signal clicked()

func _ready():
	connect("input_event", self.on_input_event)

func on_input_event(camera, event, click_position, click_normal, shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
		self.emit_signal("clicked")
