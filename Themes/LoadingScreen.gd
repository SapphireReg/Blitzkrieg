extends Control

onready var loading_bar = $LoadingBar
var load_time = 3

func _ready():
	$Tween.interpolate_property($LoadingBar, "value", 0,100, load_time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	get_tree().change_scene("res://Scenes/World/Lvl1_Landing.tscn")
