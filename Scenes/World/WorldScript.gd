extends Node2D

onready var player = get_node("Player")
onready var HUDBullet = get_tree().get_current_scene().get_node("HUDNode/HUD/Bullet")

func _ready():
	pass

func _on_KeyPickUp1_body_entered(body):
	if body.get_collision_layer_bit(0):
		$Key1.queue_free()
		remove_blockage($Blockage1)
	
func _on_KeyPickUp2_body_entered(body):
	if body.get_collision_layer_bit(0):
		$Key2.queue_free()
		remove_blockage($Blockage2)
		
func _on_KeyPickUp3_body_entered(body):
	if body.get_collision_layer_bit(0):
		$Key3.queue_free()
		remove_blockage($Blockage3)
		
func _on_KeyPickUp4_body_entered(body):
	if body.get_collision_layer_bit(0):
		$Key4.queue_free()
		remove_blockage($Blockage4)
		
func _on_KeyPickUp5_body_entered(body):
	if body.get_collision_layer_bit(0):
		$Key5.queue_free()
		remove_blockage($Blockage5)

func remove_blockage(blockage):
	for block in blockage.get_children():
		block.get_node("AnimatedSprite").play("Break")
	yield(get_tree().create_timer(1), "timeout")
	blockage.queue_free()

func check_coins():
	if Global.coins == 7:
		Global.bullet_level += 1
		Global.coins = 0
		if Global.bullet_level == 2:
			Global.bulletDmg = 75
			Global.BULLET = preload("res://Scenes/Player/Bullet2.tscn")
			HUDBullet.play("Bullet2")
		elif Global.bullet_level == 3:
			Global.bulletDmg = 150
			Global.BULLET = preload("res://Scenes/Player/Bullet3.tscn")
			HUDBullet.play("Bullet3")
