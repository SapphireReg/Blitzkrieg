extends Control

export var next_scene = "res://Scenes/World/Lvl1_Landing.tscn"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var load_time = 3
onready var tween = $Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	#$Continue_Button.visible = false
	tween.interpolate_property($LoadingBar, "value", 0,100, load_time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	scene_load_status = ResourceLoader.load_interactive_status(scene,progress)
#	progress_bar.value = progress[0] * 100
#	if (scene_load_status = ResourceLoader.THREAD_LOAD_LOADED):
#		$MenuContinue.visible = true

#func _on_Continue_Button_pressed():
#	if (scene_load_status = ResourceLoader.THREAD_LOAD_LOADED):
#		get_tree().change_scene_to(ResourceLoader.load_interactive_get(scene))
#		queue_free()
#	else:
#		print("Scene not loaded or in progress")






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_all_completed():
	if next_scene !=null:
		get_tree().change_scene(next_scene)
