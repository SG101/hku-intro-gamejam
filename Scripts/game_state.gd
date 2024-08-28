extends Node

var time_started : float
const TARGET_TIME : float = 6 * 60
const HOUR_LENGTH : float = 60
var camera : PlayerCamera = null
var camera_home : Node3D

func end_game():
	pass # TODO

func _ready():
	pass
	
func get_ticks_sec() -> float:
	return Time.get_ticks_msec() * 1000.0
	
func get_time() -> float:
	return self.get_ticks_sec() - self.time_started

func get_progress() -> float:
	return self.get_ticks_sec() / self.TARGET_TIME

func move_camera(to : Node3D):
	self.camera.to_node(to)

func return_camera():
	self.move_camera(camera_home)
