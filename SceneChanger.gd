extends Node


func _ready():
	pass
	

func goto_scene(path, current_scene):
	yield(get_tree().create_timer(.5), "timeout")
	get_tree().paused = true
	var loader = ResourceLoader.load_interactive(path)
	
	var loading_bar = load("res://Scenes/World/Loading_Scene.tscn").instance()
	
	get_tree().get_root().call_deferred("add_child", loading_bar)
	
	while true:
		var err = loader.poll()
		if err == ERR_FILE_EOF:
			#loading complete
			var resource = loader.get_resource()
			get_tree().get_root().call_deferred("add_child", resource.instance())
			current_scene.queue_free()
			loading_bar.queue_free()
			get_tree().paused = false
			break
		elif err == OK:
			#still loading
			var progress = float(loader.get_stage())/loader.get_stage_count()
			loading_bar.value = progress * 100
			print(progress)
		yield(get_tree(), "idle_frame")
