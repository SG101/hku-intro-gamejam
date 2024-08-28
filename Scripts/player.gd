extends Camera3D

const PAN_SPEED : float = 2

@onready var target_global_position : Vector3 = self.global_position

func _process(delta : float):
	self.global_position = self.global_position.move_toward(self.target_global_position, PAN_SPEED * delta)
