extends Node2D


func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.get_collision_layer_bit(0):
		Global.coins += 1
		Global.check_coins()
		self.queue_free()
