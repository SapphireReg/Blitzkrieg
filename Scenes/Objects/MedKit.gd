extends Node2D

onready var player = get_parent().get_node("Player")

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.get_collision_layer_bit(0):
		player.hp_update(50)
		Global.playerHp += 50
		queue_free()
		if Global.playerHp > 100:
			Global.playerHp = 100
