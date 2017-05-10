extends Container

export var resize = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	_fit_children()

func _fit_children():
	# either uniform horizontaly or vertically
	var count = self.get_child_count()
	var bounds = self.get_item_rect()
	
	var shared_sz = Vector2(
		floor(bounds.size.x / count),
		bounds.size.y
	)
	
	print("shared_sz", shared_sz)
	for i in range(0, count):
		var child = self.get_child(i)
		var child_pos = self.get_global_pos()
		var pos = Vector2(
		    shared_sz.width * i,
		    child_pos.y
		)
		#var margin_top = float(pos.y) / bounds.size.height;
		    
		# print("Pos: ", pos)
		child.set_size(shared_sz)
		# child.set_anchor_and_margin(MARGIN_LEFT, ANCHOR_BEGIN, pos.x)
		child.set_anchor_and_margin(MARGIN_TOP, ANCHOR_RATIO, 0)
		child.set_anchor_and_margin(MARGIN_BOTTOM, ANCHOR_RATIO, 1.0)

	

func _notification(what):
	if what == NOTIFICATION_SORT_CHILDREN:
		#_fit_children()
		pass