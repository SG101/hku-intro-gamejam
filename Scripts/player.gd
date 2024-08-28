class_name PlayerCamera
extends Camera3D

const PAN_SPEED : float = 2
const ZOOM_SPEED : float = 2

func _enter_tree():
	GameState.camera = self

func to_node(target : Node3D):
	self.global_position = target.global_position
