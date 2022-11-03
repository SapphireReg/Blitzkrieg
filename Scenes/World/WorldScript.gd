extends Node2D

onready var blockage1 = $Blockage1/ObstacleNode/AnimatedSprite


func _ready():
	pass


func _on_KeyPickUp1_body_entered(body):
	$Key1.queue_free()
	remove_blockage($Blockage1)
	
func _on_KeyPickUp2_body_entered(body):
	$Key2.queue_free()
	remove_blockage($Blockage2)

func remove_blockage(blockage):
	for block in blockage.get_children():
		block.get_node("AnimatedSprite").play("Break")
	yield(get_tree().create_timer(1), "timeout")
	blockage.queue_free()






