extends Node2D


func _ready():
	pass

var level1 = "Lvl1_Landing"
var level2 = "Lvl2_Under"
var level3 = "Lvl3_Deeper"
var level4 = "Lvl4_Pandora"
onready var currentScene = get_tree().current_scene



func _on_Area2D_body_entered(body):
	if body == get_parent().get_node("Player"):
		if  currentScene.name == level1:
			get_tree().change_scene("res://Scenes/World/Lvl2_Under.tscn")
		elif currentScene.name == level2:
			get_tree().change_scene("res://Scenes/World/Lvl3_Deeper.tscn")
		else:
			get_tree().change_scene("res://Scenes/World/Lvl4_Pandora.tscn")
