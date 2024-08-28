class_name Door
extends Node3D

@onready var anim : AnimationPlayer = %AnimationPlayer
@export var room : Room
@onready var light = $Light

func _ready():
	room.connect("inhabitant_toggles_light", self._on_inhabitant_toggle_light)
	room.connect("light_changed", self._on_light_changed)

func _on_clickable_body_clicked() -> void:
	GameState.move_camera(room.get_node("%CameraTarget"))

func _on_inhabitant_toggle_light():
	self.anim.play("toggle_light")

func _on_light_changed(value : bool):
	light.set_visible(value)
	

func _on_clickable_body_2_clicked() -> void:
	room.switch_light(true)

func turn_light_off():
	room.switch_light(false)
