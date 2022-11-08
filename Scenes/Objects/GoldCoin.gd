extends Node2D


func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.get_collision_layer_bit(0):
		get_parent().get_parent().get_node("SFX/CoinSFX").play()
		Global.coins += 1
		get_tree().current_scene.check_coins()
		self.queue_free()
