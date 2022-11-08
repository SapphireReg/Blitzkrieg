extends Button

export var node: NodePath
export(bool) var start_focused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if(start_focused):
		grab_focus()
	
	connect("mouse_entered", self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_mouse_entered():
	grab_focus()
	
func _on_Button_Pressed():
	if (self.name == "MenuPlay"):
		get_tree().change_scene("res://Themes/LoadingScreen.tscn")
	elif (self.name == "MenuMainMenu"):
		get_tree().change_scene("res://Scenes/Buttons/TitleMenuButton.tscn")
	elif (node != ""):
		get_node(node).visible = true
		self.get_parent().visible = false
	else:
		get_tree().quit()

