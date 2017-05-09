func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_left"):
		self.translate(Vector2(-10,0))
	if event.is_action_pressed("ui_right"):
		self.translate(Vector2(10,0))