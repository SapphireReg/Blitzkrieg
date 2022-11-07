extends Node2D

var level1 = "Lvl1_Landing"
var level2 = "Lvl2_Under"
var level3 = "Lvl3_Deeper"
var level4 = "Lvl4_Pandora"
onready var currentScene = get_tree().current_scene


func _ready():
	if currentScene.name == level1 or currentScene.name == level2:
		$AnimatedSprite.play("Portal1")
	else:
		$AnimatedSprite.play("Portal2")

func _on_Area2D_body_entered(body):
	if body == get_parent().get_node("Player"):
		if  currentScene.name == level1:
			SceneChanger.goto_scene("res://Scenes/World/Lvl2_Under.tscn", currentScene)
		elif currentScene.name == level2:
			SceneChanger.goto_scene("res://Scenes/World/Lvl3_Deeper.tscn", currentScene)
		elif currentScene.name == level3:
			SceneChanger.goto_scene("res://Scenes/World/Lvl4_Pandora.tscn", currentScene)
