extends ClickableBody

func _ready():
	self.connect("clicked", self.on_clicked)

func on_clicked():
	print("AAAAAAA")
	pass
