class_name Room
extends Node3D

signal light_changed(value : bool)
signal inhabitant_toggles_light()

var lights_on : bool = true
var has_pillow : bool = false

const SPEED : float = 2
var state : Callable = decider

@onready var room : Sprite3D = %Room
@onready var animp : AnimationPlayer = %AnimationPlayer
@export var lights_on_tex : Texture2D
@export var lights_off_tex : Texture2D

func _ready():
	switch_light(true)

# LIGHTS
func start_lights(_delta : float):
	self.inhabitant_toggles_light.emit()

func process_lights(_delta : float):
	if !self.lights_on:
		self.state = self.decider

# SLEEP
func start_sleep(_delta : float):
	self.animp.speed_scale = 1.0 + (0.2 * GameState.get_progress())
	if has_pillow:
		self.animp.speed_scale -= 0.5
	self.animp.play("sleep")

func process_sleep(_delta : float):
	if !self.can_sleep():
		self.state = self.decider
	elif !self.animp.is_playing():
		GameState.end_game()

func decider(_delta: float):
	if lights_on:
		state = self.start_lights
	else:
		state = self.start_sleep

func can_sleep() -> bool:
	return !lights_on

func switch_light(value : bool):
	lights_on = value
	light_changed.emit(value)
	if lights_on:
		room.texture = lights_on_tex
	else:
		room.texture = lights_off_tex
		

func _process(delta : float):
	self.state.call(delta)

func _on_return_area_clicked() -> void:
	GameState.return_camera()
